library(stringr)
library(purrr)

allowed_files = c("part_2/hw3_part_2.Rmd",
                  "hw3.Rproj",
                  "hw3_whitelist.R",
                  "README.md",
                  "wercker.yml",
                  ".gitignore",
                  ".*\\.xlsx",
                  ".*\\.pdf",
                  ".*\\.png")

files = dir(recursive=TRUE, full.names=TRUE)
disallowed_files = !map_lgl(files, ~ any(str_detect(., allowed_files)))

if (any(disallowed_files))
{
  cat("Disallowed files found:\n")
  cat("  (remove the following files from your repo)\n\n")

  for(file in files[disallowed_files])
    cat("*",file,"\n")

  quit("no",1,FALSE)
}
