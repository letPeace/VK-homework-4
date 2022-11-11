import org.flywaydb.core.Flyway;
import org.jetbrains.annotations.NotNull;

public class Application {

    public static final @NotNull String CONNECTION = "jdbc:postgresql://localhost/";
    public static final @NotNull String DB_NAME = "onlineCourses";
    public static final @NotNull String USERNAME = "postgres";
    public static final @NotNull String PASSWORD = "admin";

    public static void main(@NotNull String[] args) {
        final Flyway flyway = Flyway
                .configure()
                .dataSource(CONNECTION + DB_NAME, USERNAME, PASSWORD)
                .locations("migrations")
                .cleanDisabled(false)
                .load();
        flyway.clean();
        flyway.migrate();
    }

}
