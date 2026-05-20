# 000_Creating a chart using Swift Charts.pdf

## Page 1

Help people understand complex data by focusing on what you want to communicate and who
you’re communicating to. For example, suppose that you have a collection of colorful toy shapes:
You can formulate questions about this data that you’d like to answer, like which toy shape appea
the most, or how many toys are green? One way to represent your data is to collect it into a table.
table organizes the data into columns and rows so it can be easily inspected. For example, you ca
record how many shapes of each color you have:
Cube
Sphere
Pyramid
Total
Pink
1
2
0
3
Overview
Swift Charts / Creating a chart using Swift Charts
Article
Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.


## Page 2

Cube
Sphere
Pyramid
Total
Yellow
1
1
2
4
Purple
1
1
1
3
Green
2
0
1
3
Total
5
4
4
13
However, in many cases, a more effective data representation is a chart. A chart allows you to
communicate large amounts of information all at once. The kind of chart that you create and the
way you configure the chart depend on what you want to show. To create a chart with Swift Chart
define your data and initialize a Chart view with marks and data properties. Then use modifiers t
customize different components of the chart, like the legend, axes, and scale.
Think about a chart as an answer to your questions. Suppose you want to know which toy shape
appears the most. Start by visualizing how many of each shape you have. To display this
information with a chart, create a ToyShape structure that represents the information that you
want to visualize:
Then, initialize an array of ToyShape structures to hold the data from the table:
In a real app, you might download this data from a network connection, or load it from a file.
Define the data source
Initialize a chart view and create marks


## Page 3

Create a Chart view that serves as a container for the data series that you want to draw:
Inside the chart, specify the graphical marks that represent the data. You can populate it with a
variety of kinds of marks, like BarMark, PointMark or LineMark, that plot your data. The kind 
mark that you choose depends on how you want to visualize the data. For example, you can use
LineMark to create a line chart or PointMark to produce a scatter plot. In this case, creating a
bar chart is a good way to convey the number of each type of toy shape, so you use BarMark:
The resulting chart clearly communicates that the cube toy shape appears the most:


## Page 4

Scale determines the position, height, and color of each BarMark. As you plot data on the y-
dimension, the framework automatically generates axis labels for the y-axis to map the data value
The scale for the y-dimension is adjusted to match the range of totals for the shape’s group.
The above code lists each BarMark individually. However, for regular, repetitive data, you can use
a ForEach structure to represent the same chart more concisely:
The above bar chart shows how much of each type of toy shape there are, but the earlier table
separates each toy shape by color as well. A stacked bar chart can visualize not only the amount 
each toy shape type, but also the distribution of colors among the shapes. Before you can plot th
new information, you need to represent color in your data structure:
Explore additional data properties


## Page 5

Then update the initialized data to include the color information:
To represent this additional dimension of information, add the foregroundStyle(by:) method
to the BarMark, and indicate the data’s color property as the plottable value:
The chart now splits the bars into different parts that represent the number of colors for each
shape:


## Page 6

The stacked bar chart chooses colors to represent the new data, and adds a legend to indicate
which color represents which kind of data.
For many charts, the default configuration works well. However, in this case, the colors that the
framework assigns to each mark don’t match the shape colors that they represent. You can
customize the chart to override the default color scale by adding the chartForegroundStyle
Scale(_:) chart modifier:
Customize your chart


## Page 7

Now the names of the colors match the colors used in the chart, making the chart easier to
understand:
This chart makes the relationship between shape counts and colors clear. You can customize
charts in many other ways. For example, you can set the bar width, choose different legend
symbols, and control the axes.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
struct Chart
A SwiftUI view that displays a chart.
protocol ChartContent
A type that represents the content that you draw on a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
struct Plot
See Also
Charts


## Page 8

A mechanism for grouping chart contents into a single entity.


