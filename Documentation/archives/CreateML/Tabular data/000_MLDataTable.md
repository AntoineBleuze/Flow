# 000_MLDataTable.pdf

## Page 1

Creating a word tagger model
Creating a text classifier model
MLDataTable is Create ML’s version of a spreadsheet in which each row represents an entity
(such as a book, in the example below) with observable features. Each column (MLDataColumn o
MLUntypedColumn) in the table represents an observable feature of that entity, such as a book’s
title or author.
Mentioned in
Overview
Create ML / MLDataTable
Structure
MLDataTable
A table of data for training or evaluating a machine learning model.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
tvOS 16.0+
visionOS 1.0+


## Page 2

In most cases you interact with columns using the typed MLDataColumn, especially when you
need to directly access the contents of a column. You can also interact with columns using
MLUntypedColumn, if the underlying type of the column isn’t important.
After you create a data table, you can modify it with methods like append(contentsOf:), add
Column(_:named:), and removeColumn(named:). You can also filter or map the contents of
the data table to derive new data tables or new columns by using various subscripts and methods
like dropDuplicates() or map(_:).
Note
For a demonstration that creates and uses data tables, see Creating a model from tabular data.
Finally, when your data table is ready, use it to train and evaluate a model from these groups:
Regressors like MLRegressor and its supporting types
Classifiers like MLClassifier and its supporting types
Natural language processing types like MLTextClassifier and MLWordTagger
Note
It’s easier to train an MLTextClassifier from folders and files with init(trainingData:
parameters:) if your data is ready to use, as-is. Otherwise, use a data table to prepare your
data before training a text classifier.
Creating a model from tabular data
Train a machine learning model by using Core ML to import and manage tabular data.
init(contentsOf: URL, options: MLDataTable.ParsingOptions) throws
Creates a data table from an imported JSON or CSV file.
init(dictionary: [String : any MLDataValueConvertible]) throws
Creates a data table from a dictionary of column names and data values.
init(namedColumns: [String : MLUntypedColumn]) throws
Creates a data table from a dictionary of column names and untyped columns.
Topics
Creating a data table


## Page 3

init()
Creates an empty table containing no rows or columns.
struct ParsingOptions
The options for parsing a comma-separated values (CSV) file into a data table for a machine
learning model.
var size: (rows: Int, columns: Int)
The number of rows and columns in the data table.
func map(_:)
Creates a new column by applying a given thread-safe transform to every row in the data
table.
func addColumn(_:named:)
Adds an untyped column to the table.
struct MLDataColumn
A column of typed values in a data table.
struct MLUntypedColumn
A column of untyped values in a data table.
subscript(_:)
Retrieves or adds an untyped column with the specified name.
subscript<T>(String, T.Type) -> MLDataColumn<T>?
Retrieves a column with the specified name and type.
func renameColumn(named: String, to: String)
Getting the size of a data table
Transforming rows to generate a data column
Adding columns
Accessing columns
Renaming columns


## Page 4

Changes the name of an existing column.
func removeColumn(named: String)
Removes the column with the specified name.
func append(contentsOf: MLDataTable)
Appends the contents of the given data table to the end of this data table.
Data table derivation operations
Create new data tables by manipulating an existing data table.
func randomSplitBySequence(proportion: Double, by: String, on: String,
seed: Int) -> (MLDataTable, remaining: MLDataTable)
func stratifiedSplit<RNG>(proportions: [Double], on: String, generator:
inout RNG) throws -> MLDataTable
Randomly split a MLDataTable into a number partitions while stratifying on a user-define labe
column.
func stratifiedSplit(proportions: [Double], on: String, seed: Int)
throws -> MLDataTable
Randomly split a MLDataTable into a number partitions while stratifying on a user-define labe
column.
func stratifiedSplitBySequence<RNG>(proportions: [Double], by: String,
on: String, generator: inout RNG) throws -> MLDataTable
Randomly split a MLDataTable into partitions on a user-define label column, while keeping
rows from the same sequence in the original order.
func stratifiedSplitBySequence(proportions: [Double], by: String, on:
String, seed: Int) throws -> MLDataTable
Randomly split a MLDataTable into partitions on a user-define label column, while keeping
rows from the same sequence in the original order.
Removing columns
Appending to a data table
Generating new data tables
Splitting a data table


## Page 5

struct Row
A row of untyped values in a data table.
var rows: MLDataTable.Rows
The rows of data in the table.
struct Rows
A collection of rows in a data table.
var columnNames: MLDataTable.ColumnNames
The names of the columns in the data table.
struct ColumnNames
A collection of the names of the columns in a data table.
var columnTypes: [String : MLDataValue.ValueType]
The type of the data in each column.
func write(to: URL) throws
Exports a binary file of the data table to the given directory URL.
func write(toDirectory: String) throws
Exports a binary file of the data table to the given directory path.
func writeCSV(to: URL) throws
Exports a CSV file of the data table to the given directory URL.
func writeCSV(toFile: String) throws
Exports a CSV file of the data table to the given directory path.
func show() -> any MLStreamingVisualizable
Generates a visualization for the data in the table.
Getting information about a data table’s rows
Getting information about a data table’s columns
Saving a data table
Visualizing a data table


## Page 6

Deprecated
var description: String
A text representation of the data table.
var playgroundDescription: Any
A description of the data table shown in a playground.
var isValid: Bool
A Boolean value that indicates whether the data table is valid.
var error: (any Error)?
The underlying error present when the data table is invalid.
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable, CustomPlaygroundDisplayConvertible, CustomStringConvertible
enum MLDataValue
The value of a cell in a data table.
Describing a data table
Handling data table errors
Default Implementations
Relationships
Conforms To
See Also
Tabular data


## Page 7

Data visualizations
Render images of data tables and columns in a playground.


