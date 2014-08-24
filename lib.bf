/* lib.bf
 * A set of simple brain**** library functions
 * 
 * Author: Chris Jones
 * Last Updated: 5/29/2013
 *
 * Index 0 refers to the cell at the current position of the tape head when the function is executed.
 * Similarly, index i refers to the ith cell to the right.
 * Negative indices will never be assumed to exist.
 * The tape head ends on index 0
 *
 * Input/output is notated by
 * in: x_1[i_1], x_2[i_2], ..., x_n[i_n]
 * where the function takes x_1, ..., x_n as arguments, in indices i_1, ..., i_n respectively. 
 * Similarly for output.
 *
 * Functions that require cells for calculation search for the nearest empty cell to the right. Cells are empty upon completion.
 *
 */

/* kill
 * in: a[0]
 * out: 0[0]
 */
[-]

/* move
 * in: a[0] 0[1]
 * out: 0[0] a[1]
 */
[->+<]

/* equal
 * in: a[0], b[1], 0[2]
 * out: a[0], b[1], a==b ? 1 : 0 [2]
 */
[]>[]>+

/* copy
 * in: a[0], 0[1], 0[2]
 * out: a[0], a[1], 0[2]
 */
[->+>+<<]>>[-<<+>>]<<

/* add
 * in: a[0], b[1], 0[2], 0[3]
 * out: a+b[0], b[1], 0[2], 0[3]
 */
>[->+>+<<]>>[-<<+>>]<<[-<+>]>[-<+>]<<

/* subtract
 * in: a[0], b[1]
 * out: a-b[0], 0[1]
 */
>[-<->]< 

/* multiply
 * in: a[0], b[1], 0[2], 0[3]
 * out: a*b[0], b[1], 0[2], 0[3]
 */
>[->+>+<<]>>[-<<+>>]<[-<[-<+>]>]<<

/* divide
 * in: a[0], b[1], 0[2]
 * out: a div b [0], a mod b [1], b[2]
 */

/* cipher
 * in: a_0[0], ..., a_25[25], c_0[26], ..., c_n[26+n], 0[27+n]
 * out: a_0[0], ..., a_25[25], ciphered text of c_0...c_n using substitution a->a_0, b->a_1, ..., z->a_25
 */
>>>>>>>>>>>>>>>>>>>>>>>>>>
