# About the project

![simulation waveform](https://cloud.githubusercontent.com/assets/8753560/26434553/c00efb5e-40df-11e7-9eb5-719f3dcd6a1e.PNG "Direct mapping")


This is a VHDL implementation of an adaptative Performance-aware algorithm for Memory Caching. If you're studying this subject, and need more info, please refer to the 'Context' topics.

This project was developed in 2014.

## How do i run this?

This project was developed using Quartus. I'd say the easiest way to import it would be to take the .vhd files you find useful. If you want the whole project structure, just clone the Core folder. Do note there's also 'Modules' folder, in case you need individual functionalities.

## Useful information

- The cache is made of 16 '32-bits' registers

- This simulates the behavior of 4 types of cache associativity (which are listed a couple of sections below). There isn't, however, an actual CPU implementation. It's mocked. The cake is a lie.

- The code was modularized, but lacks documentation. I'm available if you need any part of it for your own project (e-mail provided in the last section).

# Context


## What is caching?

Every processor uses extremely fast memories, named Cache memories, to store copies of highly-used (or recently used) data as close as possible to the CPU itself. It allows for the processor to access it faster when further usage is needed.There may be multiple levels of cache(L1, L2, etc), each being closer to the cores... But that's not what this is about.

Anyway, when data is required by the CPU, it first verifies whether or not it's stored in the cache. There are algorithms used to reserve sectors of the cache for specific candidates in the main memory. This prevents data being stored twice in the cache, for instance.

## What are we doing here, exactly?

We're using a finite-state machine to change the cache's associativity algorithm whenever the miss rate is above a certain treshold. It then runs in the desired algorithm until the memory's scenario becomes awful enough for the miss rate to go over said treshold.

## Associativity algorithms

- Direct Mapping
- 4-way set associative
- 8-way set associative
- Fully associative

# Contact

Feel free to e-mail me at marcelluiz96@hotmail.com (or marcelluiz960@gmail.com)