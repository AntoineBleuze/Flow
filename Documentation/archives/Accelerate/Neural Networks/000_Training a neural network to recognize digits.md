# 000_Training a neural network to recognize digits.pdf

## Page 1

This sample code project uses the Basic Neural Network Subroutines (BNNS) library to create a
simple neural network that’s capable of recognizing digits.
The sample iterates over randomly generated digits in the training phase, incrementally improving
its ability to recognize numbers. After the code completes the training phase, it evaluates its
accuracy at recognizing numbers, and returns a score.
A 6 x 6 matrix represents each digit. For example, the code below represents the number 3:
The network consists of the three layers below:
Fused convolution-batch normalization layer
Pooling layer
Fully connected layer
Overview
Accelerate / Training a neural network to recognize digits
Sample Code
Training a neural network to recognize
digits
Build a simple neural network and train it to recognize randomly generated
numbers.
Download
macOS 12.0+
Xcode 14.3+


## Page 2

After the code completes a forward pass, it calculates its loss, which is a score that indicates how
the predicted values deviate from the labels. The sample code project uses the gradients that the
loss generates as the basis for the backward pass, where it backward-applies the three layers in
reverse order.
The backward passes generate gradient values that an optimizer uses to update the parameters
below:
Convolution weights that the app initializes with random values, and bias
Normalization beta (offset) and gamma (scale)
Fully connected weights
The optimizer’s gradual changes to the weights, bias, beta, and gamma increases the network’s
efficacy in recognizing digits with each iteration.
The image below shows the relationships between the layers:
The sample creates a BNNSFilterParameters structure with useClientPointer. This flag
instructs the layers to keep the provided pointers at creation time, and to work directly from that
data rather than use internal copies of the data.
Define the filter parameters


## Page 3

The convolution-batch normalization layer consists of two sublayers.
Convolution layers that generate their output by multiplying each input value and its neighbors
by corresponding values in an array of weights, and then adding a corresponding bias. Each
output value is the sum of each of those operations. Convolution layers are fundamental to
convolutional neural networks and, with the correct weights and bias values, can identify
features, such as horizontal and vertical lines.
Normalization layers that rescale their data so that all of the batches of data have the same
standard deviation.
The app initializes the convolution weights array with random values.
The app initializes the convolution bias and the batch normalization beta and gamma arrays with a
repeated scalar value.
Create the fused convolution-batch normalization layer


## Page 4

The code below creates the fused layer that applies convolution and normalization to the input:


## Page 5

Pooling layers downscale their input while preserving the most important information and produce
an output that, in the case of this sample code project, consists of the maximum value in each inp
pixel’s local neighborhood.
The following code creates the pooling layer:
Fully connected layers compute the matrix-vector product of a weights matrix and its input, and
flatten the data to predict the correct label.
The app initializes the fully connected weights array with random values.
Create the pooling layer
Create the fully connected layer


## Page 6

The code below creates the fully connected layer:
The loss layer is responsible for quantifying a score that indicates how the predicted values devia
from the labels.
The code below creates the loss layer:
Create the loss layer


## Page 7

For each iteration of the training phase, the sample creates a matrix that represents a random dig
and a one-hot encoded tensor of the same digit. The sample places digits randomly in a 20 x 20
matrix, so a 3 might appear in the matrix as the image below. This example renders 0 as ⚪️, and 1
as ⚫️.
The one-hot encoded tensor contains a 1 at the zero-based index of 3.
The sample code project uses a batch size of 32, so each iteration generates 32 random digits in
random positions in the 20 x 20 grid.
To perform the forward pass, the sample code calls apply on the fused, pooling, and fully
connected layers.
Create the candidate input
Perform the forward pass


## Page 8

Calculating the loss evaluates the efficacy of the neural network. The loss layer generates its
output, lossOutput, which contains a score that indicates how the predicted values deviate fro
the labels, and lossInputGradient, which is the output gradient parameter to the backward
application of the fully connected layer.
The optimizer is responsible for updating the weights, biases, beta, and gamma. In the code below
the sample code project creates an optimizer using the Adam algorithm:
Calculate the loss and loss gradient
Create the optimizer


## Page 9

The sample code project performs the backward pass in reverse order to the forward pass.
Therefore, the sample’s first step is to call applyBackward on the fully connected layer, and
perform an optimization step on its weights.
The applyBackward call on the fully connected layer generates an input gradient that acts as th
output gradient for the pooling layer’s backward apply, and a weights gradient that passes to the
fully connected optimizer step.
The backward pass on the pooling layer generates an input gradient that’s the output gradient to
the backward apply of the fused layer.
The sample calls applyBackward on the fused layer. This performs an optimization step on the
convolution layer’s weights and bias, and the normalization layer’s beta and gamma.
Perform a backward pass and optimization step on the fully
connected layer
Perform a backward pass on the pooling layer
Perform a backward pass and optimization step on the
fused layer


## Page 10

The code below performs the optimization step:
After the app completes all the optimization steps for this iteration, it increments the optimizer tim
step.
The sample iterates over the forward, loss, backward, and optimization steps, and with each
iteration, the trend of the loss is to reduce. The following graph shows the loss, as a solid stroke,
decreasing during training:
The code in the sample defines a maximum number of iterations. Additionally, it calculates a
moving average of recent loss values, which appear as a dashed stroke in the graph above. At eac
Evaluate the neural network


## Page 11

iteration, the sample checks whether the recent average loss is below that threshold, and, if it is, 
breaks from the training phase early.


## Page 12

After the training phase completes, the sample calculates the accuracy of the network over a new
dataset. It then creates a new batch of random digits and runs a forward pass of the network.
Finally, the app evaluates the accuracy of the network by comparing the values in the fully
connected layer’s output to the one-hot labels. For example, when the recognized digit is 3, one-
hot labels contain the values [0, 0, 0, 1, 0, 0, 0, 0, 0, 0], and values in the fully
connected layer’s output might be as follows:
Note that in each case, the highest value in the fully connected layer’s output is at index 3.
The following code performs that evaluation for each digit in the batch:


## Page 13

The evaluation function prints out something like the following:
In this case, the neural network accurately predicts each ground truth digit.
See Also
Neural Networks


## Page 14

BNNS
Implement and run neural networks for training and inference.


