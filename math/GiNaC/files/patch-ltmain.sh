--- ltmain.sh.orig	Thu Nov 22 23:00:08 2001
+++ ltmain.sh	Fri Dec  7 23:34:47 2001
@@ -1043,14 +1043,14 @@
 	    # These systems don't actually have a C library (as such)
 	    test "X$arg" = "X-lc" && continue
 	    ;;
-	  *-*-openbsd*)
+	  *-*-openbsd* | *-*-freebsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test "X$arg" = "X-lc" && continue
 	    ;;
 	  esac
 	 elif test "X$arg" = "X-lc_r"; then
 	  case $host in
-	  *-*-openbsd*)
+	  *-*-openbsd* | *-*-freebsd*)
 	    # Do not include libc_r directly, use -pthread flag.
 	    continue
 	    ;;
@@ -4210,10 +4210,12 @@
 	fi
 
 	# Install the pseudo-library for information purposes.
+	if /usr/bin/false ; then
 	name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
 	instname="$dir/$name"i
 	$show "$install_prog $instname $destdir/$name"
 	$run eval "$install_prog $instname $destdir/$name" || exit $?
+	fi
 
 	# Maybe install the static library, too.
 	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
