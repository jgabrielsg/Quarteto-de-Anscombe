library(ggplot2)
library(tidyverse)
library(cowplot)

# primeira tabela
g1 <- data.frame(x = c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5),
                y = c(8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68))

# segunda tabela
g2 <- data.frame(x = c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5),
                y = c(9.14, 8.14, 8.74, 8.77, 9.26, 8.10, 6.13, 3.10, 9.13, 7.26, 4.74))

# terceira tabela
g3 <- data.frame(x = c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5),
                y = c(7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.42, 5.73))

# quarta tabela
g4 <- data.frame(x = c(8, 8, 8, 8, 8, 8, 8, 19, 8, 8, 8),
                y = c(6.58, 5.76, 7.71, 8.84, 8.47, 7.04, 5.25, 12.50, 5.56, 7.91, 6.89))

View(g1)
View(g2)
View(g3)
View(g4)

# G1
mean(g1$y)
var(g1$y)
cor(g1$x, g1$y)

#G2
mean(g2$y)
var(g2$y)
cor(g2$x, g2$y)

#G3
mean(g3$y)
var(g3$y)
cor(g3$x, g3$y)

#G4
mean(g4$y)
var(g4$y)
cor(g4$x, g4$y)



plot1 <- ggplot(g1, aes(x, y)) +
  geom_point(size=3, color="red") +
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE) +
  labs(title = "Anscombe I") +
  xlim(2, 20) +
  ylim(2, 15) +
  theme_classic() +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

plot2 <- ggplot(g2, aes(x, y)) +
  geom_point(size=3, color="red") +
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE) +
  labs(title = "Anscombe II") +
  xlim(2, 20) +
  ylim(2, 15) +
  theme_classic() +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

plot3 <- ggplot(g3, aes(x, y)) +
  geom_point(size=3, color="red") +
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE) +
  labs(title = "Anscombe III") +
  xlim(2, 20) +
  ylim(2, 15) +
  theme_classic() +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

plot4 <- ggplot(g4, aes(x, y)) +
  geom_point(size=3, color="red") +
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE) +
  labs(title = "Anscombe IV") +
  xlim(2, 20) +
  ylim(2, 15) +
  theme_classic() +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

library(patchwork)
plot_all <- plot1 + plot2 + plot3 + plot4

plot_all <- ggdraw(plot_all) +
  draw_line(x= c(0.5, 0.5), y=c(1, 0), color="black", size=2) +
  draw_line(x= c(1, 0), y=c(0.5, 0.5), color="black", size=2) +
  draw_text("Quarteto de Anscombe, por João Gabriel", x=0.3, y=0.98, size=14)


ggsave("anscombe_plots.png", plot_all, width = 16, height = 8, units = "in")
