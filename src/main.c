#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TOOL_NAME "template-c-utility"
#define TOOL_VERSION "0.1.0"

static void print_help(void) {
    printf("Usage: %s [OPTIONS] [COMMAND]\n\n", TOOL_NAME);
    printf("A compiled C utility for sstix-tools.\n\n");
    printf("Options:\n");
    printf("  -h, --help       Show this help message and exit\n");
    printf("  -v, --version    Show version information and exit\n\n");
    printf("Commands:\n");
    printf("  status           Show utility status\n");
    printf("  run              Run the main task\n");
}

static void print_version(void) {
    printf("%s version %s\n", TOOL_NAME, TOOL_VERSION);
}

int main(int argc, char *argv[]) {
    const char *cmd = "status";

    if (argc > 1) {
        cmd = argv[1];
    }

    if (strcmp(cmd, "-h") == 0 || strcmp(cmd, "--help") == 0) {
        print_help();
        return 0;
    }

    if (strcmp(cmd, "-v") == 0 || strcmp(cmd, "--version") == 0) {
        print_version();
        return 0;
    }

    if (strcmp(cmd, "status") == 0) {
        printf("[%s] Status: OK (compiled binary)\n", TOOL_NAME);
        return 0;
    }

    if (strcmp(cmd, "run") == 0) {
        printf("[%s] Executing compiled task...\n", TOOL_NAME);
        return 0;
    }

    fprintf(stderr, "Error: Unknown command '%s'\n", cmd);
    fprintf(stderr, "Run '%s --help' for usage.\n", TOOL_NAME);
    return 1;
}
