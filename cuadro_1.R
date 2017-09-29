candidatos = c("Sánchez", "Goic", "Piñera", "Guillier", "Kast",
               "Navarro", "Enríquez-Ominami", "Artés")
encuesta_ubb = mutate(encuesta_ubb, 
                      P10 = recode_factor(P10,
                                          `1` ="Sánchez",
                                          `2` = "Goic",
                                          `3` = "Piñera",
                                          `4` = "Guillier",
                                          `5` = "Kast",
                                          `6` = "Navarro",
                                          `7` = "Enríquez-Ominami",
                                          `8` = "Artés",
                                          .default = "nada"))

design = svydesign(~0, weights = NULL, strata=NULL, data = encuesta_ubb )

data = svytable(~P10, design) %>% data.frame()

data = mutate(data, Freq=Freq/sum(Freq)) %>% 
  mutate(pos = 1-cumsum(Freq)+Freq/2)

bp<- ggplot(data, aes(x="", y=Freq, fill=P10))+
  geom_bar(width = 1, stat = "identity")


pie = bp +coord_polar(theta = "y", start=0, directio =1)

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_text(color='black') ,
    plot.title=element_text(size=14, face="bold")
  )

pie = pie+ scale_fill_brewer("Candidatos")+blank_theme+
  theme(axis.text.x=element_blank(), text=element_text(size=12, family="AvantGarde"))+
  geom_text(aes(y = pos, label=scales::percent(Freq)), size=5, check_overlap = TRUE)+
  labs(title="Si las elecciones fueran este domingo \n ¿Por quién votaría ustede para presidente \n de la república?")

ggsave("pie.pdf", device = "pdf")