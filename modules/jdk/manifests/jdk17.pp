class jdk::jdk17 {
        #install Java 7 64 bits into /usr/java64
        $jdk17_packagename = hiera('bin_repo::url')
        $bin_repo_url = hiera('jdk17::packagename')
        package { "$jdk64_packagename":
                provider => 'yum',
                ensure => installed,
#                ensure =>  hiera('jdk17::version'),
                source => "${bin_repo_url}/$jdk64_packagename.x86_64.rpm",
        }
}
