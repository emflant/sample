library(shiny)

# Valid examples are "01_hello", "02_text", "03_reactivity", 
# "04_mpg", "05_sliders", "06_tabsets", "07_widgets", "08_html", 
# 09_upload", "10_download", "11_timer"
runExample("11_timer")
runExample()



# runGist
runGist("eb3470beb1c0252bd0289cbc89bcf36f")

gsub
faithful
x    <- faithful$waiting
bins <- seq(min(x), max(x), length.out = 30 + 1)

hist(x, breaks = bins, col = "#75AADB", border = "white",
     xlab = "Waiting time to next eruption (in mins)",
     main = "Histogram of waiting times")


