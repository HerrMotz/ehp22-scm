### unsigned:
- negative bit spielt keine Rolle (weil wir keine negativen Zahlen betrachten)
- zero bit wird natürlich beachtet
- carry wird ggf. gesetzt, z. B. wenn bei der Addition ein Übertrag entsteht. Ist daher hier relevant.
- das Overflow bit wird hier ignoriert, da es in manchen Fällen keinen Sinn ergibt. Das Betrachten des carry-bits reicht für unsigned integers aus

### signed:
- n: hier gibt es negative Zahlen, ist also sinnvoll zu betrachten.
- z: selbstverständlich auch relevant, das Ergebnis kann ja 0 sein.
- das carry-bit ist hier nicht sinnvoll. Als Beispiel dient die zweite Zeile aus table7_4_2: Hier ist c gesetzt, obwohl das result 0 ist.
- Stattdessen wird das v-bit betrachtet, welches einen möglichen Overflow anzeigt. Das kann in verschiedenen Fällen passieren, z.B. bei der Addition zweier positiver Zahlen, oder der Addition zweier negative Zahlen etc.

# Task 3:
+ addition and subtraction can be done with ADDS and SUBS
## adds
[ARM Documentation](https://developer.arm.com/documentation/ddi0597/2022-03/Base-Instructions/ADD--ADDS--register---Add--register--?lang=en)

+ One needs to set a destination register in order to get the NZCV-flags.
+ Apart from that the behaviour compared of ADDS to ADD is the same, for the purposes we need.
+ side note: Using [ADCS](https://developer.arm.com/documentation/ddi0597/2022-03/Base-Instructions/ADC--ADCS--immediate---Add-with-Carry--immediate--?lang=en) we can also input a carry bit.
+ e.g. `adds x0, x1, #2` adds 2 to the contents of `x1` and puts it in `x0`, where xN is 64-bit register
+ for x we can similarly write w

## subs
[SUB{S}](https://developer.arm.com/documentation/dui0473/m/arm-and-thumb-instructions/sub?lang=en)
+ e.g. `subs x0, x1, x2` subtracts contents of `x2` from `x1` and puts it in `x0`