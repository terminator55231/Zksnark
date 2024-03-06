pragma circom 2.0.0;

template Circuit () {
    signal input a;
    signal input b;
    signal x;
    signal y;
    signal output q;

    component andGate = AND();
    component notB = NOT();
    component orGate = OR();

    andGate.a <== a;
    andGate.b <== b;
    notB.in <== b;
    orGate.x <== andGate.out;
    orGate.y <== notB.out;

    x <== andGate.out;
    y <== notB.out;
    q <== orGate.out;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;
    out <== a * b;
}

template NOT() {
    signal input in;
    signal output out;
    out <== 1 - in;
}

template OR() {
    signal input x;
    signal input y;
    signal output out;
    out <== x + y - x * y;
}

component main = Circuit();
