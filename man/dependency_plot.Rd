% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dependency_graphs.R
\name{dependency_plot}
\alias{dependency_plot}
\title{Plot network for dependenciesGraphs object}
\usage{
dependency_plot(object, block = FALSE, width = NULL, height = NULL)
}
\arguments{
\item{object}{: dependenciesGraphs object.}

\item{block}{: Boolean. Default to False. When false, the nodes that are not fixed can be dragged by the user.}

\item{width}{: Width (optional, defaults to automatic sizing)}

\item{height}{: Height (optional, defaults to automatic sizing)}
}
\description{
Plot network for dependenciesGraphs object. Using visNetwork package. Adapted from the method
\code{plot} in 'DependenciesGraphs'
}
\examples{
\dontrun{
if (!require(DependenciesGraphs)) install.packages("DependenciesGraphs")
if (!require(visNetwork)) install.packages("visNetwork")
dep <- dependency_visualization('natverse', level = 'level_1')
dependency_plot(dep)

# size
dependency_plot(dep, height = "800px", width = "100\%")
}
}
