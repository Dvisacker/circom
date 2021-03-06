include "binsum.circom"
include "sigma.circom"

template SigmaPlus() {
    signal input in2[32];
    signal input in7[32];
    signal input in15[32];
    signal input in16[32];
    signal output out[32];

    component sum = BinSum(32, 4);
    component sigma1 = SmallSigma(17,19,10);
    component sigma0 = SmallSigma(7, 18, 3);

    for (var k=0; k<32; k++) {
        sigma1.in[k] <== in2[k];
        sigma0.in[k] <== in15[k];

        sum.in[0][k] <== sigma1.out[k];
        sum.in[1][k] <== in7[k];
        sum.in[2][k] <== sigma0.out[k];
        sum.in[3][k] <== in16[k];

        out[k] <== sum.out[k];
    }
}
