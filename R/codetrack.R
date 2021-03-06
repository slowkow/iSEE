.track_it_all <- function(rObjects, pObjects, se_name, ecm_name) 
{
  # Commands only reported for plots, not for the tables
  aobjs <- as.data.frame(rObjects$active_panels)
  aobjs <- aobjs[aobjs$Type!="geneStat",]
  aobjs <- aobjs[.get_reporting_order(aobjs, pObjects$brush_links),]

  # storing to a text character vector
  tracked_code <- c(
    "## The following list of commands will generate the plots created using iSEE.",
    "## Copy them into a script or an R session containing your SingleCellExperiment.",
    "## All commands below refer to your SingleCellExperiment object as `se`.",
    "",
    sprintf("se <- %s", se_name),
    sprintf("colormap <- %s", ecm_name),
    "all_coordinates <- list()",
    "")

  for (i in seq_len(nrow(aobjs))) {
    panel_type <- aobjs$Type[i]
    panel_id <- aobjs$ID[i]
    panel_name <- paste0(panel_type, "Plot", panel_id)
    
    tracked_code <- c(tracked_code,
                      strrep("#", 80),
                      paste0("## ", .decode_panel_name(panel_type, panel_id)),
                      strrep("#", 80),
                      "")

    # Adding the plotting commands.
    cur_cmds <- pObjects$commands[[panel_name]]
    collated <- c(cur_cmds$data, "")
    if (length(cur_cmds$lim)) {
        collated <- c(collated, "# Defining plot limits", cur_cmds$lim, "")
    }
    if (length(cur_cmds$brush)) {
        collated <- c(collated, "# Receiving brush data", cur_cmds$brush, "")
    }

    # Saving data for transmission after brushes have been processed;
    # this is the equivalent point in .create_plots() where coordinates are saved.
    collated <- c(collated, "# Saving data for transmission", 
                  sprintf("all_coordinates[['%s']] <- plot.data", panel_name),
                  "")

    # Finishing off the rest of the commands.
    if (length(cur_cmds$setup)) {
        collated <- c(collated, "# Setting up plot aesthetics", cur_cmds$setup, "")        
    }
    if (length(cur_cmds$plot)) {
        collated <- c(collated, "# Creating the plot", cur_cmds$plot, "")        
    }

    tracked_code <- c(tracked_code, collated, "")
  }

  tracked_code <- c(tracked_code,
                    strrep("#", 80),
                    "## To guarantee the reproducibility of your code, you should also",
                    "## record the output of sessionInfo()",
                    "sessionInfo()")

  # Restoring indenting for multi-line ggplot code.
  tracked_code <- unlist(tracked_code)
  ggplot_ix <- grep("\\+$", tracked_code) + 1L
  to_mod <- tracked_code[ggplot_ix]
  to_mod <- paste0("    ", to_mod)
  to_mod <- sub("\n", "\n    ", to_mod)
  tracked_code[ggplot_ix] <- to_mod

  return(tracked_code)
}

.get_reporting_order <- function(active_plots, brush_chart) 
# Reordering plots by whether or not they exhibited brushing.
{
  N <- nrow(active_plots)
  node_names <- sprintf("%sPlot%i", active_plots$Type, active_plots$ID)
  ordering <- topo_sort(brush_chart, "out")
  order(match(node_names, names(ordering)))
}



.snapshot_graph_linkedpanels <- function(rObjects, pObjects) 
# reads in the stored r/p objects, and creates a graph of the current links among
# all panels open in the app  
{
  cur_plots <- sprintf("%sPlot%i", rObjects$active_panels$Type, rObjects$active_panels$ID)
  not_used <- setdiff(V(pObjects$brush_links)$name,cur_plots)
  currgraph_used <- delete.vertices(pObjects$brush_links,not_used)
  currgraph_used <- set_vertex_attr(currgraph_used,"plottype",
                                    value = gsub("Plot[0-9]","",V(currgraph_used)$name))
  
  currgraph_used <- .find_links_to_table(rObjects, pObjects, currgraph_used)
  
  plot(currgraph_used,
       edge.arrow.size = .8,
       vertex.label.cex = 1.3,
       vertex.label.family = "Helvetica",
       vertex.label.color = "black",
       vertex.label.dist = 2.5,
       vertex.color = c(.plothexcode_redDim,.plothexcode_colData,
                        .plothexcode_geneExpr,.plothexcode_geneTable)[
                          factor(V(currgraph_used)$plottype,
                                 levels = c("redDim","colData","geneExpr","geneStat"))])
}  



.find_links_to_table <- function(rObjects, pObjects, graph)
# finds the links for the tables that are used, and sets the new edges in the graph
# this updated graph is then returned as output
{
  tbl_objs <- rObjects$active_panels[rObjects$active_panels$Type=="geneStat",]
  cur_tables <- sprintf("%sTable%i",tbl_objs$Type,tbl_objs$ID)
  all_tlinks <- pObjects$table_links
  cur_tlinks <- all_tlinks[cur_tables]
  
  # for every table in use
  for (i in seq_len(nrow(tbl_objs))) {
    table_used <- cur_tables[i]
    col_links <- unlist(cur_tlinks[[table_used]]$color)
    x_links <- unlist(cur_tlinks[[table_used]]$xaxis)
    y_links <- unlist(cur_tlinks[[table_used]]$yaxis)
    any_links <- unique(c(col_links,x_links,y_links))
    
    # add the vertex of the table
    graph <- add_vertices(graph,nv = 1, name = table_used, plottype = "geneStat")
    # add the edges corresponding
    for(j in seq_len(length(any_links))){
      graph <- add_edges(graph,c(table_used, any_links[j]))
    }
  }
  return(graph)
}
