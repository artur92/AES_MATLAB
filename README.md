# AES_MATLAB
AES  encryption and decryption using lookup table



HE title of Advanced Encryption Standard (AES) was given to the winning algorithm of the 2000 US government 
competition to select a new standard symmetric-key cryptography algorithm. The winner in question is known 
as the Rijndael algorithm [1-3], of which there are three different versions, based on different key lengths. 
Herein, we will focus on the most basic version, AES-128, with a key and plaintext length of 128 bits 
(organised into 16 bytes) per block, and which is based on finite field arithmetic [4]. 
The algorithm is a recursive one, based on a cyclical structure with four basic operations: ShiftRows, SubBytes, 
MixColumns, and AddRoundKey. These are cycled through a number of times depending on the key length; in the AES-128 
case, there are 10 rounds, of which the last does not include MixColumns, and also an extra “zeroth” round consisting 
only of an extra AddRoundKey. For the AddRoundKey operations, a set of round keys must be generated from the original
key in another operation called KeyGeneration or KeySchedule: the add round key is a simple bitwise xor operation between 
the current state and the round key. ShiftRows involves reordering the bytes of the current state, SubBytes is a per-byte 
substitution stage, and MixColumns involves manipulating sets of 4 bytes at a time to produce another set of 4 bytes. 
Decryption involves the inverses of each of these modules, which typically can be equivalently realised using the same sets 
of Galois field operations but with the numbers modified. Applications of this algorithm in hardware are generally divided into 
high-throughput applications, in which the main design consideration is the speed at which plaintext can be encrypted, and low-area applications, in which limiting the hardware 
and power consumption is the main constraint. FPGAs are a common hardware implementation method for both. One design aspect 
is the size of the data path: in our design this is 8 bits, but 128 or 32 are also common. High-throughput designs generally 
consist of loop-unrolled architectures relying on pipelining to increase their speed [5-9]. The focus of this report is 
low-area, where the main metric of quality is the number of FPGA slices used. An early influential paper was by Good & Benaissa[5],
which detailed 8-bit data path designs for FPGAs based on ASIP and Picoblaze implementations, using 124 and 119 slices 
respectively, plus two BRAMS, on a Spartan II FPGA. Many incremental improvements have since been made to individual components 
and exploitation of aspects of FPGAs [10-15].
In this paper an 8-bit memoryless FPGA implementation of the AES cipher is presented. The design requires 349 slices 
and can achieve throughputs of 31.4 Mbps on a Spartan 3 (XC3S50) FPGA, 210 slices with a throughput of 47.46 Mbps on a 
Spartan 6 (XC6SLX4), and 244 slices with a throughput of 91.5 Mbps on an Artix7.
