## NAME
    gpg-group - interactively manage GnuPG groups
## USAGE
    gpg-group --help
    gpg-group groups
    gpg-group show [-f] NAME
    gpg-group edit NAME
    gpg-group new NAME

## DESCRIPTION
    Simple interactive interface for managing GnuPG groups via GPGCONF(1)

    -h  display this help and exit

## COMMANDS

    gpg-group groups
        list all group names defined in config

    gpg-group show [-f] NAME
        show members of a group
        -f      show fingerprints instead of uids
        NAME    name of group to show

    gpg-group edit NAME
        launch interactive editor for group. See EDITING GROUPS
        NAME    name of group to edit

    gpg-group new NAME
        create a new group and lauch interactive editor.
        NAME    name of group to create

## EDITING GROUPS
    The initial editor screen displays the name of the group you are currently
    editing, the number of keys currently associated with the group, a
    SELECT(3P) menu consisting of all the valid UID's represented by the
    associated fingerprints, and a menu describing valid actions. An asterisk
    (*) after the group name indicates that there are currently unsaved changes
    to the group.

    Entering the number of a UID from the select menu will remove that key from
    the group. Other valid actions are:

    A - Add a key to the group
        When adding a key to a group, you will first be prompted for a string to
        search for. This is passed to GPG(1) --list-keys. Only valid keys that
        are not already in the group will be displayed. You will then be shown
        another select menu displaying the UID's of the resulting keys. Entering
        the number of a displayed UID will add the keys fingerprint to the
        group. Your changes must still be saved.

    S - Save all changes to groups
        Any actions taken (add, remove, copy, delete) only alter in the in
        memory state of the group aliases, and must be saved back to the
        configuration file. Saving will attempt to persist the changes using
        gpgconf and revert to the previous state if gpgconf reports an invalid
        configuration

    C - Copy a group to another name
        Copying a group will copy the currently selected keys to a new group.
        You will be prompted for the new name. The name of the new group must
        not already exist. This is similar to a "save as" funciton, however,
        your changes will still need to be saved using the save command.

    D - Delete the current group
        Deleting a group will remove the group from the configuration. You will
        be prompted for confirmation. After confirmation, the editor will save
        and quit.

    Q - Quit the editor
        When quitting the editor, if the groups configration in memory differes
        from the persisted state of the groups, you will be prompted for
        confirmation before loosing your changes.

## SEE ALSO
    gpg(1), gpgconf(1)


