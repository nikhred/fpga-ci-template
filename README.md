## fpga-ci-template

Minimal FPGA project to demonstrate the `fpga-ci-lib` Jenkins Shared Library. Contains a simple blinky design for a Xilinx (Basys3) board, a VUnit test, and CI config.

- `rtl/`: VHDL blinky and top wrapper
- `tb/`: VUnit testbench and Python runner
- `constraints/`: Example XDC for Basys3 (adjust pins for your board)
- `ci/config.yaml`: Config consumed by the shared library
- `Jenkinsfile`: Calls `fpgaPipeline(cfg)` from the library

## Local simulation
- `pip install vunit_hdl`
- `cd tb && python3 run.py`

## Jenkins usage
```
@Library('fpga-ci-lib@v0.1.0') _
node('docker') {
  checkout scm
}

def cfg = readYaml(file: 'ci/config.yaml')
fpgaPipeline(cfg)
```

## Notes
- The XDC targets a Digilent Basys3 (100 MHz clock). Change `constraints/top.xdc` and `build.part` to match your board.
- The VUnit test uses a small divider generic for fast simulation.

