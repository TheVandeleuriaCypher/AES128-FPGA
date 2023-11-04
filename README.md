# AES128-FPGA
Implementing AES128 with Verilog on an FPGA to encrypt data with input keys
•	Following industry cryptography standards, it performs complex mathematical processes, revolving around binary matrix operations using Verilog
•	Runs a key scheduler under the main key management module to ensure that for every round of encryption, the key changes, as a countermeasure to cryptanalysis methods such as slide attacks
•	Provides a user interface to allow for the encryption of up to 16 8-bit Unicode characters, as well as the input of a 128-bit key
•	Designed to allow for easy adjustment of the Implementation Constraints File, with a user guide and clear guided comments to allow running on most FPGA boards
