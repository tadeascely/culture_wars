library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(dplyr)
library(tidyverse)
library(sf)

europe <- ne_countries(continent = "Europe", returnclass = "sf") %>%
  filter(name != "Russia")

map_new <- Countries_IsAlC |> group_by(Country, domain) |>
  summarize(align = mean(cor, na.rm = TRUE))

map_new = map_new|> pivot_wider(names_from = domain, values_from = align)
map_new = map_new|> mutate(outcome = Cultural-Economic)

map_new = map_new|> mutate(Country = case_when(Country == "Czech Republic" ~ "Czechia",
                                               TRUE ~ Country))

map_data <- europe %>%
  left_join(map_new, by = c("name" = "Country"))

map_data <- map_data %>%
  mutate(centroid = st_centroid(geometry),
         long = st_coordinates(centroid)[, 1],
         lat = st_coordinates(centroid)[, 2])

# Filter out territories based on latitude and longitude
map_data <- map_data %>% mutate(long = case_when(name == "France" ~ 1.8,
                                                  TRUE ~ long),
                                lat = case_when(name == "France" ~ 46.6,
                                                TRUE ~ lat))


map <- ggplot(data = map_data) +
  geom_sf(aes(fill = outcome)) +
  geom_text(aes(x = long, y = lat, label = round(outcome, 2)), size = 4, 
            color = "black") +
  scale_fill_gradient(
    low = "darkslategray1",   # Light color for lower values
    high = "darkslategray",   # Dark color for higher values
    na.value = "grey80", # Color for NA values
    name = "outcome"
  ) +
  labs(title = "") +
  coord_sf(
    xlim = c(-25, 40),    # Longitude limits for continental Europe
    ylim = c(32, 70),     # Latitude limits for continental Europe
    expand = FALSE
  ) +
  theme_classic() +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    legend.position = "none"
  )

svg("map.svg", height = 5, width = 5)
map
dev.off()


map_new <- final_results_df |> group_by(Country, domain) |>
  summarize(align = mean(Correlation, na.rm = TRUE))

map_new = map_new|> pivot_wider(names_from = domain, values_from = align)
map_new = map_new|> mutate(outcome = Cultural-Economic)

map_new = map_new|> mutate(Country = case_when(Country == "Czech Republic" ~ "Czechia",
                                               TRUE ~ Country))

map_data <- europe %>%
  left_join(map_new, by = c("name" = "Country"))

map_data <- map_data %>%
  mutate(centroid = st_centroid(geometry),
         long = st_coordinates(centroid)[, 1],
         lat = st_coordinates(centroid)[, 2])

# Filter out territories based on latitude and longitude
map_data <- map_data %>% mutate(long = case_when(name == "France" ~ 1.8,
                                                 TRUE ~ long),
                                lat = case_when(name == "France" ~ 46.6,
                                                TRUE ~ lat))


map <- ggplot(data = map_data) +
  geom_sf(aes(fill = Cultural)) +
  geom_text(aes(x = long, y = lat, label = round(Cultural, 2)), size = 4, 
            color = "black") +
  scale_fill_gradient(
    low = "darkslategray1",   # Light color for lower values
    high = "darkslategray",   # Dark color for higher values
    na.value = "grey80", # Color for NA values
    name = "outcome"
  ) +
  labs(title = "") +
  coord_sf(
    xlim = c(-25, 40),    # Longitude limits for continental Europe
    ylim = c(32, 70),     # Latitude limits for continental Europe
    expand = FALSE
  ) +
  theme_classic() +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    legend.position = "none"
  )

svg("map2.svg", height = 5, width = 5)
map
dev.off()

