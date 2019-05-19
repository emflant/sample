graph <- create_graph()
graph %>% render_graph()
ndf <-
  create_node_df(n = 4)
ndf
graph <-
  create_graph(
    nodes_df = ndf)
graph %>% 
  render_graph()
graph %>%
  get_node_info()
ndf <-
  create_node_df(
    n = 4,
    label = TRUE,
    type = c("type_1", "type_1",
             "type_5", "type_2"),
    shape = c("circle", "circle",
              "rectangle", "rectangle"),
    values = c(3.5, 2.6, 9.4, 2.7))
graph <-
  create_graph(nodes_df = ndf)
graph %>% render_graph()

graph %>%
  get_node_df()

edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "leading_to",
    values = c(7.3, 2.6, 8.3))


graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

graph %>% render_graph()

graph %>%
  get_node_df()

graph %>%
  get_edge_df()




example_graph <-
  create_graph() %>%
  add_pa_graph(
    n = 50,
    m = 1,
    set_seed = 23) %>%
  add_gnp_graph(
    n = 50,
    p = 1/100,
    set_seed = 23) %>%
  join_node_attrs(
    df = get_betweenness(.)) %>%
  join_node_attrs(
    df = get_degree_total(.)) %>%
  colorize_node_attrs(
    node_attr_from = total_degree,
    node_attr_to = fillcolor,
    palette = "Greens",
    alpha = 90) %>%
  rescale_node_attrs(
    node_attr_from = betweenness,
    to_lower_bound = 0.5,
    to_upper_bound = 1.0,
    node_attr_to = height) %>%
  select_nodes_by_id(
    nodes = get_articulation_points(.)) %>%
  set_node_attrs_ws(
    node_attr = peripheries,
    value = 2) %>%
  set_node_attrs_ws(
    node_attr = penwidth,
    value = 3) %>%
  clear_selection() %>%
  set_node_attr_to_display(
    attr = NULL)
example_graph %>%
  render_graph(layout = "nicely")


mermaid("sequenceDiagram
    participant Alice
        participant Bob
        Alice->>John: Hello John, how are you?
        loop Healthcheck
        John->>John: Fight against hypochondria
        end
        Note right of John: Rational thoughts <br/>prevail...
        John-->>Alice: Great!
        John->>Bob: How about you?
        Bob-->>John: Jolly good!")

