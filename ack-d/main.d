module main;

import std.stdio;
import std.parallelism;

int ack(int x, int y) {
	if (x == 0) 
		return y + 1;
	else if (y == 0)
		return ack(x - 1, 1);
	else
		return ack(x - 1, ack(x, y - 1));
}

int[] acks() {
	int[3] input;
	int[] output;
	foreach(i; parallel(input)) {
		output[i] = ack(i, i + 1);
	}

	return output;
}

void main(string[] args) {
	writeln("Hello World!");

	int[] ackReturn = acks();
	foreach(i; ackReturn) {
		writeln(i);
	}

	stdin.readln();
}

