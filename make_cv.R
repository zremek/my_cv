# https://github.com/nstrayer/datadrivencv/issues/81#issuecomment-1014809230 

# remotes::install_local("datadrivencv-master.zip")
# 
# remotes::install_github("mitchelloharawild/icons")
# 
# library(icons)
# 

# run ?datadrivencv::use_datadriven_cv to see more details
datadrivencv::use_datadriven_cv(
  full_name = "Remigiusz Żulicki",
  data_location = "https://docs.google.com/spreadsheets/d/13uQcsdVCP2Mes7t-Xl4--kYbpbm0a0_H2PKz4aW1nAU/edit?usp=sharing",
  pdf_location = "https://github.com/zremek/my_cv/blob/main/cv.pdf",
  html_location = "https://raw.githack.com/zremek/my_cv/main/cv.html",
  source_location = "https://github.com/zremek/my_cv"
)


# Knit the HTML version
rmarkdown::render("cv.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "cv.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "cv.pdf")




