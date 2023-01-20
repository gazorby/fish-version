set version_split (string split "." "$version")
set major $version_split[1]
set minor $version_split[2]
set patch $version_split[3]

# Compare fish version

fish_version_test -eq $version
@test "-eq operator" "$status" = 0

fish_version_test -eq foo
@test "-ne operator" "$status" = 1

fish_version_test -gt (string join "." (math "$major" + 1) $minor $patch)
@test "-gt operator major" "$status" = 1

fish_version_test -gt (string join "." $major (math "$minor" + 1) $patch)
@test "-gt operator minor" "$status" = 1

fish_version_test -gt (string join "." $major $minor (math "$patch" + 1))
@test "-gt operator patch" "$status" = 1

fish_version_test -lt (string join "." (math "$major" + 1) $minor $patch)
@test "-lt operator major" "$status" = 0

fish_version_test -lt (string join "." $major (math "$minor" + 1) $patch)
@test "-lt operator minor" "$status" = 0

fish_version_test -lt (string join "." $major $minor (math "$patch" + 1))
@test "-lt operator patch" "$status" = 0

# Compare arbitrary versions

set _version "1.2.3"
set version_split (string split "." "$_version")
set major $version_split[1]
set minor $version_split[2]
set patch $version_split[3]

fish_version_test "$_version" -eq "$_version"
@test "-eq operator arbitrary versions" "$status" = 0

fish_version_test "$_version" -eq foo
@test "-ne operator arbitrary versions" "$status" = 1

fish_version_test "$_version" -gt (string join "." (math "$major" + 1) $minor $patch)
@test "-gt operator major arbitrary versions" "$status" = 1

fish_version_test "$_version" -gt (string join "." $major (math "$minor" + 1) $patch)
@test "-gt operator minor arbitrary versions" "$status" = 1

fish_version_test "$_version" -gt (string join "." $major $minor (math "$patch" + 1))
@test "-gt operator patch arbitrary versions" "$status" = 1

fish_version_test "$_version" -lt (string join "." (math "$major" + 1) $minor $patch)
@test "-lt operator major arbitrary versions" "$status" = 0

fish_version_test "$_version" -lt (string join "." $major (math "$minor" + 1) $patch)
@test "-lt operator minor arbitrary versions" "$status" = 0

fish_version_test "$_version" -lt (string join "." $major $minor (math "$patch" + 1))
@test "-lt operator patch arbitrary versions" "$status" = 0
