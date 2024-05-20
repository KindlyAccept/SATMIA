# A Spatial Architecture Template for Mutual Information Acceleration

**ID26:** A Spatial Architecture Template for Mutual Information Acceleration 
**Abstract:** Mutual Information (MI) is a widespread similarity metric that drives the optimization of image registration procedures. Though extremely complex, this project aims to design a template spatial architecture through the SATL library and compare against the current state-of-the-art HLS-based accelerator. 

**Keywords:** FPGA, Similarity Metric, Spatial Architectures,, Mutual Information, Chisel

## Setup
This repo is intended to be used within the Chipyard framework: https://github.com/ucb-bar/chipyard .
To setup this repo, follow the installation instructions for Chipyard, then clone this repository in the `/generators` directory.

Add in `chipyard/build.sbt` the follwing code:

```
lazy val spatial_templates = (project in file("./generators/spatial_templates"))
  .dependsOn(testchipip, rocketchip, hardfloat)
  .settings(libraryDependencies ++= rocketLibDeps.value)
  .settings(chiselTestSettings)
  .settings(commonSettings)
  .settings(chiselSettings)
```

To run tests, move to the root directory of this project and run

```
sbt "testOnly spatial_templates.[TesterToRun] -- -DwriteVcd=1"
```

where [TesterToRun] is a Chisel tester in the 'src/test/scala' directory. Omit -- -DwriteVcd=1 to skip VCD generation.

## Repo Structure

```
|-- LICENSE
|-- README.md
|-- berkeley-hardfloat
|-- src
|   |-- main
|   |   |-- resources
|   |   `-- scala
|   |       |-- main scala codebase
|   `-- test
|       |-- scala
|       |   |-- scala tests
|       |-- software
|       |   |-- utility C host code
`-- test_run_dir
    |-- test results directory
```
