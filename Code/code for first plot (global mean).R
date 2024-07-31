library(tidyverse)
read_csv("data/GLB.Ts+dSST.csv", skip=1, na = "***") %>%
  select(year = Year, t_diff = `J-D`) %>%
  ggplot(aes(x=year, y=t_diff)) + 
  geom_line(color = "gray") + 
  geom_point(fill = "white", color = "gray", shape = 21) +
  theme_light() +
  scale_x_continuous(breaks = seq(1800, 2023, 20), expand = c(0,0)) +
  scale_y_continuous(limits = c(-0.5, 1.5), expand = c(0,0)) +
  geom_smooth(se= FALSE, color = "black", size = 0.5, span = 0.15) +
  labs(
    x = "YEAR",
    y = "Temperature anomaly (C)",
    title = "GLOBAL LAND-OCEAN TEMPERATURE INDEX",
    subtitle = "Data Source: NASA's Goddard institute for Space Studies (GISS)"
  ) +
  theme(
    axis.ticks = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(margin = margin(b=10), color = "red", face = "bold"),
    plot.subtitle = element_text(size = 8, margin = margin(b=10))
  )



ggsave("visuals_figures/temperature_index_plot.png", width = 6, height= 4)
