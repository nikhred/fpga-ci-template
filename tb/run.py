#!/usr/bin/env python3
from pathlib import Path
from vunit import VUnit

root = Path(__file__).resolve().parents[1]

ui = VUnit.from_argv()
lib = ui.add_library("lib")
lib.add_source_files(str(root / "rtl" / "*.vhd"))
lib.add_source_files(str(root / "tb" / "tb_*.vhd"))

ui.main()

