library(dplyr)
library(ggplot2)

tab=read.csv("joined_data.csv")
# tab$time = as.POSIXct(tab$time)
tab$posixTime=as.POSIXct(lubridate::hms(tab$time), origin = lubridate::origin)
# tab$posixTime
graph <- tab |>
  group_by(posixTime) |>
  summarise(count = n_distinct(user)) |>
  plot(
     col="red",
     xlab="Время",
     ylab = "Кол-во пользователей",
     main = "Кол-во активных пользователей во время тестов",
     xaxt = "n",
     asp = 1) |>
  axis.POSIXct(side = 1, format = "%H:%M:%S")

graph2 <- tab |>
  group_by(posixTime, operation) |>
  summarise(line90 = quantile(operation_time_ms/1000, .9))

glimpse(graph2)

ggplot(graph2) + geom_point(mapping = aes(posixTime, line90, color = operation))

# + ggplot2::geom_point(mapping = aes(posixTime, line90))