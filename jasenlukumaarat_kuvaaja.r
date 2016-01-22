# Kuvaaja Helsinki Hacklabin jäsenien lukumääristä eri vuosina


# R-ohjelma (vaatii kirjaston ggplot2), joka piirtää kuvaajan Helsinki Hacklabin jäsenlukumääristä 
# kierrossa olleista avaimista vuodesta 2010 alkaen. Tiedot poimittu blogista, wikistä, avainkuiteista, jäsenrekisteristä ym.
# Tiedot jäsenlukumäärästä vuosina 2013 ja 2014 puuttuvat, eivät olleet saatavilla missään.
# Huom. kuvaaja ei ota kantaa tietojen paikkansapitävyyteen: rekistereissä on ollut varsinkin vuoteen 2016 asti mukana monia jäsenmaksua maksamattomia.



# wiki_maara sisältää jäsenlukumäärät wikiin ja blogiin kirjoitetuista tiedoista
wiki_maara <- list()
wiki_maara$y <- c(0,   #lähtötilanne
                  31,  #jäsenlukumäärän tieto wikistä
                  56,  #https://wiki.hackerspaces.org/w/index.php?title=Helsinki_Hacklab&oldid=10313
                  65,  #https://wiki.hackerspaces.org/w/index.php?title=Helsinki_Hacklab&oldid=11098
                  68,  #https://wiki.hackerspaces.org/w/index.php?title=Helsinki_Hacklab&oldid=11310
                  92,  #jäsenlukumäärä http://helsinki.hacklab.fi/2011/02/helsinki-hacklab-laajentui/
                  120, #jäsenlukumäärän tieto wikistä
                  135, #https://wiki.hackerspaces.org/w/index.php?title=Helsinki_Hacklab&oldid=21092
                  165) #jäsenlukumäärän tieto wikistä
wiki_maara$x <- as.Date(c("2010-02-07",
                          "2010-02-10",
                          "2010-04-30",
                          "2010-06-24",
                          "2010-07-05",
                          "2011-02-09",
                          "2011-12-21",
                          "2012-01-09",
                          "2012-09-21"))



# Tiedot jäsenrekisteri karsinasta
karsina_maara <- list()
karsina_maara$y <- c(271,
                     251, # pudotusta jäsenmäärässä, jäsenrekisterin siivous vai onko 1. luku väärin?
                     260,
                     272,
                     283)
karsina_maara$x <- as.Date(c("2015-02-05",
                             "2015-04-01",
                             "2015-06-23",
                             "2015-10-22",
                             "2016-01-14"))



# Avainlukumäärä avainkuittien päivämäärien perusteella laskettuna.
# Nämä numerot on laskettu alkuperäisten avainkuittien perusteella ja
# taulukoitu tähän dataan päivämäärän kanssa aina kun avaimia on jaettu lisää tai palautettu.

avainkuitit <- list()
avainkuitit$y <- c(0,2,6,7,8,11,12,14,15,16,18,
                    19,20,21,22,23,24,25,26,27,
                    28,29,28,27,28,29,30,29,31,
                    32,33,34,35,36,37,38,39,40,
                    38,39,38,37,36,37,36,35,34,
                    35,34,33,27)
avainkuitit$x <- as.Date(c(
  "2010-02-10",
  "2010-07-12",
  "2010-07-13",
  "2010-07-15",
  "2010-07-16",
  "2010-07-20",
  "2010-08-10",
  "2010-08-24",
  "2010-08-30",
  "2010-09-21",
  "2010-11-02",
  "2011-02-15",
  "2011-03-08",
  "2011-06-14",
  "2011-09-27",
  "2011-11-08",
  "2012-02-07",
  "2012-02-11",
  "2012-04-17",
  "2012-04-24",
  "2012-06-07",
  "2012-06-09",
  "2012-09-29",
  "2013-01-01",
  "2013-02-16",
  "2013-03-09",
  "2013-06-03",
  "2013-08-13",
  "2013-08-15",
  "2013-10-11",
  "2013-10-17",
  "2013-11-29",
  "2013-12-14",
  "2014-01-19",
  "2014-01-21",
  "2014-01-30",
  "2014-02-11",
  "2014-04-08",
  "2014-05-10",
  "2014-05-13",
  "2014-06-01",
  "2014-06-03",
  "2014-06-24",
  "2014-07-08",
  "2014-07-08",
  "2014-07-11",
  "2014-09-02",
  "2014-09-16",
  "2014-10-01",
  "2014-10-23",
  "2014-11-25"
))

# Karsinasta, eli vuoden 2016 alkuun asti käytössä olleesta jäsenrekisteristä poimitut avainlukumäärät
# Tieto käyty noutamassa silloin tällöin - rekisteristä ei ollut saatavilla säännöllisiä raportteja
karsina_avain <- list()

# lukumäärä = kokonaislukumäärä vähennettynä erikoisavaimilla ja kuoletetuilla avaimilla
# erikoisavaimilla tarkoitetaan SATSin, SER-keräyksen, alivuokralaisten ja oppilaitosten avaimia, vara-avaimia tms.
karsina_avain$y <- c(26, # = 37 (total) - 10 (erikois) - 1 (revoked)
                     32, # = 44 (total) - 11 (erikois) - 1 (revoked)
                     41, # = 54 (total) - 12 (erikois) - 1 (revoked)
                     47, # = 61 (total) - 12 (erikois) - 2 (revoked)
                     48) # = 62 (total) - 12 (erikois) - 2 (revoked)

karsina_avain$x <- as.Date(c("2015-02-05",
                             "2015-04-01",
                             "2015-06-23",
                             "2015-10-22",
                             "2016-01-14"))


kaikki_maara <- list()
kaikki_avain <- list()

kaikki_maara$x <- c(wiki_maara$x, karsina_maara$x)
kaikki_maara$y <- c(wiki_maara$y, karsina_maara$y)

kaikki_avain$x <- c(avainkuitit$x, karsina_avain$x)
kaikki_avain$y <- c(avainkuitit$y, karsina_avain$y)


library(ggplot2)

avain_kuvaaja1 <- geom_line(data=data.frame(avainkuitit), aes(x=x, y=y), color="#E69F00")
avain_kuvaaja2 <- geom_line(data=data.frame(karsina_avain), aes(x=x, y=y), color="#E69F00")

jasen_kuvaaja1 <- geom_line(data=data.frame(wiki_maara), aes(x=x, y=y), color="#009E73")
jasen_kuvaaja2 <- geom_line(data=data.frame(karsina_maara), aes(x=x, y=y), color="#009E73")


selite <- data.frame(
  x = c(as.Date("2010-07-10"),
        as.Date("2014-10-20"),
        as.Date("2012-01-01"),
        as.Date("2011-06-01"),
        as.Date("2015-02-05"),
        
        as.Date("2013-01-01"),
        as.Date("2013-07-01"),
        as.Date("2014-01-01"),
        as.Date("2014-07-01")       
        ),
  y = c(150, 150, 40, 150, 200, 180, 200, 220, 240),
  text = c("Nilsiänkatu",
           "Takkatie",
           "Avainlukumäärät avainkuiteista",
           "Jäsenlukumäärät blogista, wikistä ym.",
           "Jäsenlukumäärät \nja avaimet\njäsenrekisteristä",
           "?", "?", "?", "?"),
  kulma = c(90, 90, 0, 30, 0, 0, 0, 0, 0)
  #,koko = c(2,2,2,2,2,1,1,1,1)
)
selite_kuvaaja <- geom_text(data=selite,
                            aes(x=x, y=y,
                                label = text,
                                hjust="left",
                                angle=kulma))
                                #size=koko))


molemmat_kuvaajat <- ggplot() +
  avain_kuvaaja1 + avain_kuvaaja2 +
  jasen_kuvaaja1 + jasen_kuvaaja2 +
  geom_vline(aes(
    xintercept=as.numeric(as.Date("2010-06-23"))),
    linetype=4,
    colour="black") +
  geom_vline(aes(
     xintercept=as.numeric(as.Date("2014-10-01"))),
     linetype=4,
     colour="black") +
  selite_kuvaaja + xlab("Vuosi") + ylab("Avainten lukumäärä ja jäsenlukumäärä") +
  theme_bw(base_size=15) + theme(legend.position="none")

# lopuksi piirrä kuvaaja
molemmat_kuvaajat
