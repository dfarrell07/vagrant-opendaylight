#!/usr/bin/env sh
# Script to repeatedly test downloading OpenDaylight tarball
# Created to help debug issue #12. See:
# https://github.com/dfarrell07/vagrant-opendaylight/issues/12

dl_dir="."  # This will normally be a good default for non-root runs
#dl_dir="/usr/src"  # Actual dl dir used in the failing curl, requires root
dl_name="opendaylight-0.2.2.tar.gz"
odl_sha256="4461c0be129b84c98f4e02a8e3682d82bb14ca497ce91c87c5385cae6ddad3c8"

# Accept a single (optional) param for number of runs
if [ "$#" -eq 1 ]; then
    num_runs=$1
else
    # Default to 1 run
    num_runs=1
fi

# Download and validate ODL num_runs times
for ((run=0;run<$num_runs;run++)); do
    echo "# Starting run $run"

    # Remove old ODL install if present
    if [ -f $dl_dir/$dl_name ]; then
        echo "Removing old ODL dl at $dl_dir/$dl_name"
        rm -rf $dl_dir/$dl_name
    fi

    # Download ODL using same command as Archive::Download
    # NB: This command is from the trace in #12.
    #   * The output path was made into vars for shared access
    #   * The output dir may be configured to use CWD vs `/usr/src` (avoids root)
    #   * Some extra spaces were removed
    curl -s -L -o $dl_dir/$dl_name https://nexus.opendaylight.org/content/groups/public/org/opendaylight/integration/distribution-karaf/0.2.2-Helium-SR2/distribution-karaf-0.2.2-Helium-SR2.tar.gz

    # Validate that download was successful
    dl_sha256=`sha256sum $dl_dir/$dl_name | awk '{print $1}'`
    echo "SHA256 hash of dl: $dl_sha256"

    if [ "$dl_sha256" == "$odl_sha256" ]; then
        echo "Hash verified"
    else
        echo "Error: Hash didn't match expected ODL SHA256"
        echo "Expected ODL SHA256: $odl_sha256"
        exit 1
    fi

    echo "# Ending run $run"
done
