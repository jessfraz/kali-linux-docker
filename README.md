# Official Kali Linux Docker
This Kali Linux Docker image provides a minimal base install of the latest version of the Kali Linux Rolling Distribution.
There are no tools added to this image, so you will need to install them yourself. 
For details about Kali Linux metapackages, check https://www.kali.org/news/kali-linux-metapackages/

# REQUIRES EXPERIMENTAL TO BE TURNED ON
Due to --squash being passed to the docker daemon, if experimental features
aren't turned on in your daemon, the build.sh script will fail.

On Kali, this is done via /etc/docker/daemon.json having the following contents:

```
{
    "experimental": true
}
```

Note: This is only a requirement for us at Offensive Security to reduce the image size when we push a new image to Docker Hub.
If you're building for personal use, you can remove the `--squash` option in build.sh

Tue May 21 13:59:06 EDT 2019

