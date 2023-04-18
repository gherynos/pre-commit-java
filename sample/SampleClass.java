package sample;

/**
* A sample class.
*/
public final class SampleClass {

    private SampleClass() {

        System.out.println("Hello World!");  // NOPMD
    }

    /**
     * The main method.
     * @param args the arguments
     */
    public static void main(final String... args) {

        new SampleClass();
    }
}
