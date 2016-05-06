# Description

This is the documentation of the WITCH model written using Markdown and the R package [**bookdown**](https://bookdown.org/).

# Requirements

- Git + Github set up, e.g. via [GitKraken](https://www.gitkraken.com/) (cooler, more control) or via
  [GitHub Desktop](https://help.github.com/desktop/guides/getting-started/installing-github-desktop/)
  (more documented, slightly easier).
- [R installed](https://cran.r-project.org/bin/windows/base/) (or
  [R portable](https://sourceforge.net/projects/rportable/) + [change path accordingly](https://java.com/en/download/help/path.xml)).
- Latest [RStudio](https://www.rstudio.com/products/rstudio/download/preview/).
- R packages: Rcpp, devtools, knitr, shiny. E.g.:
  - Open RStudio.
  - Click on Packages tab in the bottom-right section.
  - Click on install.
  - Write the package name you want to install under the Packages field and then click install.
- R package bookdown, E.g.:
  - Open R console (e.g. in RStudio)
  - type: devtools::install_github("rstudio/bookdown")
  
# Usage

To compile an Rmd file, open it in RStudio and click the `Knit` button.

To compile the whole documentation, open `_bookdown.yml` and click the `Build
book` button on the `Build` tab in the top-right section.

Alternatively, you can use the R code below.

```{r}
library(bookdown)
render_book("index.Rmd",output_format = "bookdown::gitbook",output_dir = "html")
render_book("index.Rmd",output_format = "bookdown::pdf_book")
```

# Additional Resources

 - quick one page overview cheat sheet for the Rmd language: https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf
 - edit Markdown files in a simple online WYSIWYM editor: https://stackedit.io/editor
 - generate a custom template for tables: http://www.tablesgenerator.com/markdown_tables
 - some tools for Markdown editing: https://github.com/karthik/markdown_science/wiki/Tools-to-support-your-markdown-authoring
 - Want to write equations via touchscreen/mouse? http://webdemo.myscript.com/#/demo/equation
