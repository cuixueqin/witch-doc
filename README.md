This is the documentation of the WITCH model written using Markdown and the R package **bookdown**. To compile the documentation in html, open `index.Rmd` in RStudio and click the `Knit` button.

```{r}
library(bookdown)
render_book("index.Rmd",output_format = "bookdown::gitbook",output_dir = "html")
render_book("index.Rmd",output_format = "bookdown::pdf_book")
```

Additional tools:

 - edit Markdown files in a simple online WYSIWYM editor: https://stackedit.io/editor
 - generate a custom template for tables: http://www.tablesgenerator.com/markdown_tables
 - some tools for Markdown editing: https://github.com/karthik/markdown_science/wiki/Tools-to-support-your-markdown-authoring
 - Want to write equations via touchscreen/mouse? http://webdemo.myscript.com/#/demo/equation
