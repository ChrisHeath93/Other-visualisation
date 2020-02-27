library(tidyverse)
library(gganimate)

View(mpg)

avg_mpg <- mpg %>%
  group_by(year, manufacturer) %>%
  mutate(avg_hwy = mean(hwy))

graph <- ggplot(mpg, aes(x = cty, y = hwy, color = manufacturer)) +
  geom_jitter(show.legend = FALSE) +
  transition_states(manufacturer, transition_length = 6, state_length = 6) +
  enter_fade() +
  exit_fade() +
  shadow_wake(wake_length = 0.1) +
  labs(title = '{closest_state}', x = "City miles per gallon", y = "Highway miles per gallon") +
  ease_aes("cubic-in")

animate(graph, fps = 5)

anim_save("first_animation.gif")
