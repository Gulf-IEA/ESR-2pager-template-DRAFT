
library(dplyr)
library(gt)

sum_table = readRDS("docs/indicator_summary_table.rds")

sum_table = sum_table %>%
  subset(`Trend symbol` != "●")

sum_table %>%
  gt() %>%
  tab_row_group(
    label = "Recent trend below average",
    rows = `Trend symbol` == "-"
  ) %>%
  tab_row_group(
    label = "Recent trend above average",
    rows = `Trend symbol` == "+"
  ) %>%
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels()
  ) %>%
  cols_label(
    Indicator = ""
  ) %>%
  tab_style(
    style = cell_borders(
      sides = "right",
      color = "light gray",
      weight = px(2)
    ),
    locations = cells_body(
      columns = c(Indicator)
    )
  ) %>%
  tab_options(row_group.background.color = "lightgrey")
