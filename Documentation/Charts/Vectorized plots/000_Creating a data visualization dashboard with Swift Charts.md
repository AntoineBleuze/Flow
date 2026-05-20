# 000_Creating a data visualization dashboard with Swift Charts.pdf

## Page 1

Note
This sample code project is associated with WWDC24 session 10155: Swift Charts: Vectorized
and function plots.
This sample shows how to visualize a dataset using a variety of chart types including histograms,
scatterplots, heatmaps, and more. The sample takes advantage of vectorized plots to enable
efficient plotting data of an entire RandomAccessCollection, and function plotting to visualize
meaningful trends in that data. The app is a dashboard that visualizes large-scale solar
photovoltaic facilities in the contiguous United States by consuming data from the U.S. Geologica
Survey and Lawrence Berkeley National Laboratory.
The Scatterplot view displays a scatterplot that maps the capacity density of each facility by 
location. The sample app allows toggling between using longitude or latitude as the basis for
location.
Overview
Plot entire collections with vectorized plots
Swift Charts / Creating a data visualization dashboard with Swift Charts
Sample Code
Creating a data visualization dashboard
with Swift Charts
Visualize an entire data collection efficiently by instantiating a single vectorized
plot in Swift Charts.
Download
iOS 18.0+
iPadOS 18.0+
macOS 15.0+
visionOS 2.0+
Xcode 16.0+


## Page 2

The scatterplot uses the PointPlot type to plot the data efficiently, enabling a smooth animatio
in the chart as the underlying data changes.
The Scatterplot view displays a scatterplot that maps the capacity density (the ratio of power
generating capacity to the area) of each facility by its location. The sample applies quadratic
regression to the data to generate the regression equation:
The scatterplot uses the LinePlot type to draw the regression equation as a trend line on top of
the datapoints:
Visualize data trends with function plotting


## Page 3

The ThematicMap view displays a chart that shows the datapoints in an outline of a map of the
contiguous United States.
The sample uses LinePlot to draw the outline of a simple thematic map, connecting longitude
and latitude points of the federal borders of the contiguous United States:
The sample uses PointPlot to plot the location of each facility on the thematic map, using colo
to distinguish categorical data. The point size correlates with each facility’s capacity:
Add custom shapes to a chart


## Page 4

struct AreaPlot
Chart content that represents a function or a collection of data using the area of one or more
regions.
struct LinePlot
Chart content that represents a function or a collection of data using a sequence of
connected line segments.
struct PointPlot
Chart content that represents a collection of data using points.
struct RectanglePlot
Chart content that represents a collection of data using rectangles.
struct RulePlot
Chart content that represents a collection of data using a single horizontal or vertical rule.
struct BarPlot
Chart content that represents a collection of data using bars.
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.
See Also
Vectorized plots


