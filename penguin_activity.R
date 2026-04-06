library(palmerpenguins)
library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)

#install.packages("rpart.plot")

#load the dataset
data("penguins")

#Clean the dataset
penguins_clean <- penguins |>
  select(species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex) |>
  filter(if_all(everything(), ~ !is.na(.)))

#create the graphs 

p1 <- ggplot(penguins_clean, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "Bill Length vs Bill Depth",
    x = "Bill Length (mm)",
    y = "Bill Depth (mm)"
  ) +
  theme_minimal()
p1

p2 <- ggplot(penguins_clean, aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Species",
    x = "Species",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

p2

#This line creates the folder "graphs" so you can store your graphs
dir.create("Graphs", showWarnings = FALSE)

ggsave("graphs/bill_scatterplot.png", plot = p1, width = 8, height = 6)
ggsave("graphs/bodymass_boxplot.png", plot = p2, width = 8, height = 6)


#Simple machine learning model: Use a decision tree to predict species.
set.seed(123)

train_index <- createDataPartition(penguins_clean$species, p = 0.7, list = FALSE)
train_data <- penguins_clean[train_index, ]
test_data <- penguins_clean[-train_index, ]

tree_model <- rpart(
  species ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g,
  data = train_data,
  method = "class"
)

predictions <- predict(tree_model, test_data, type = "class")
results <- confusionMatrix(predictions, test_data$species)

print(p1)
print(p2)
print(results)
rpart.plot(tree_model)
