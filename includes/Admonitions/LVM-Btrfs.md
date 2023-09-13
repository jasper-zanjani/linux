??? info "LVM or Btrfs?"

    <iframe src="https://player.fireside.fm/v2/RUkczH-V+Xz8fxCGl#t=00:55:02?theme=dark" width="740" height="200" frameborder="0" scrolling="no"></iframe>

    <audio controls="controls">
        <source type="audio/mp3" src="https://chtbl.com/track/392D9/aphid.fireside.fm/d/1437767933/f31a453c-fa15-491f-8618-3f71f1d565e5/3b6e8589-19d1-4f16-893d-1dc3bce41ab1.mp3#t=00:55:02"></source>
    </audio>


    Brent (reading question submitted by listener): Is there any reason they use LVM at all? I generally just partition disks as Btrfs for root disks or ZFS for storage pools. What would be the advantage of adding LVM? Does it have any performance impact by adding another layer of indirection between the filesystem and disks? I use LUKS on every single disk so is there extra complexity with LVM plus LUKS plus BtrFS or ZFS? Is it worth it?

    Neal: No.

    Wes: I feel like the reason you use LVM is that you're comfortable with it and not comfortable with something like BtrFS or ZFS.

    Chris: I have successfully used LVM with XFS for a very long time on my workstation upstairs. I blow away the root and home partitions, and every install I just reconnect to that LVM group of disks, and everything just works because LVM has been around for a hundred years, and I can move from distro to distro flawlessly. And I don't have to have any complicated ZFS or BtrFS setup. So there are some advantages there, but if I were to redo that whole set of three or four disks today, I would probably just use BtrFS.

    Neal: And also, the main advantage of LVM is if you're on a simple filesystem like EXT4 or XFS. You are adding a layer of indirection to support multiple disks. But if you're using BtrFS there is not a ton of advantage to using LVM. And people might not know this but you can use LUKS without LVM.
