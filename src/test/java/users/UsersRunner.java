package users;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        // Ejecuta todos los .feature de este paquete
        return Karate.run().relativeTo(getClass());
    }
}
