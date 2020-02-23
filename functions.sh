#!/bin/bash
# COLORS {{{
    Bold=$(tput bold)
    Underline=$(tput sgr 0 1)
    Reset=$(tput sgr0)
    # Regular Colors
    Red=$(tput setaf 1)
    Green=$(tput setaf 2)
    Yellow=$(tput setaf 3)
    Blue=$(tput setaf 4)
    Purple=$(tput setaf 5)
    Cyan=$(tput setaf 6)
    White=$(tput setaf 7)
    # Bold
    BRed=${Bold}${Red}
    BGreen=${Bold}${Green}
    BYellow=${Bold}${Yellow}
    BBlue=${Bold}${Blue}
    BPurple=${Bold}${Purple}
    BCyan=${Bold}${Cyan}
    BWhite=${Bold}${White}
##
non_gentoo(){
	printf "${Red}Non Gentoo Linux detected\n"
}

print_line() {
  printf "%$(tput cols)s\n"|tr ' ' '-'
}
print_enter() {
  printf "%$(tput cols)s\n"|tr ' ' ' '
}
presskey(){
  print_enter && print_enter
  read -p "${Yellow}Press enter to continue...."
}


addrepo(){
  declare reponame
  printf "${White}Updating overlays list .... \n"
  layman -L
  presskey
  printf "${White}Enter a Repo's Name (from https://overlays.gentoo.org ONLY):    "
  read reponame
  layman -a $reponame
  emerge --sync $reponame
}

gnomereqs(){
        echo ">=media-plugins/grilo-plugins-0.3.9 tracker " >> /etc/portage/package.use/zz-autounmask
				echo ">=media-libs/gegl-0.4.20 raw " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-libs/libgdata-0.17.11 gnome-online-accounts " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-libs/folks-0.12.1 eds " >> /etc/portage/package.use/zz-autounmask
				echo ">=gnome-extra/evolution-data-server-3.32.5 vala " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/minitest-5.14.0 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/net-telnet-0.2.0 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/power_assert-1.1.5 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/rake-13.0.1 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/test-unit-3.3.5 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/xmlrpc-0.3.0 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/bundler-2.1.4 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/did_you_mean-1.4.0 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/json-2.3.0 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/rdoc-6.2.0 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/kpeg-1.1.0-r1 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/racc-1.4.16-r1 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=virtual/rubygems-16 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=dev-ruby/rubygems-3.1.2 ruby_targets_ruby27 " >> /etc/portage/package.use/zz-autounmask
				echo ">=media-libs/gst-plugins-base-1.14.5-r1 theora " >> /etc/portage/package.use/zz-autounmask
}

winereqs(){
    unmask(">=media-libs/gstreamer-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-meta-1.14.3 abi_x86_32")
    unmask(">=app-emulation/vkd3d-1.1 abi_x86_32")
    unmask(">=media-libs/vulkan-loader-1.1.125 abi_x86_32")
    unmask(">=x11-libs/xcb-util-0.4.0-r1 abi_x86_32")
    unmask(">=x11-libs/xcb-util-keysyms-0.4.0-r1 abi_x86_32")
    unmask(">=x11-libs/xcb-util-wm-0.4.1-r2 abi_x86_32")
    unmask(">=x11-libs/xcb-util-cursor-0.1.3-r2 abi_x86_32")
    unmask(">=x11-libs/xcb-util-image-0.4.0-r1 abi_x86_32")
    unmask(">=x11-libs/xcb-util-renderutil-0.3.9-r2 abi_x86_32")
    unmask(">=media-libs/gst-plugins-base-1.14.5-r1 abi_x86_32")
    unmask(">=media-libs/gst-plugins-good-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-a52dec-1.14.3 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-faad-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-dts-1.14.5 abi_x86_32")
    unmask(">=media-libs/gst-plugins-ugly-1.14.3 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-dvdread-1.14.3 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-mpeg2dec-1.14.3 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-resindvd-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-flac-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-mpg123-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-pulse-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-x264-1.14.3 abi_x86_32")
    unmask(">=media-libs/x264-0.0.20190903 abi_x86_32")
    unmask(">=media-libs/libdvdnav-6.0.1 abi_x86_32")
    unmask(">=media-libs/libdvdread-6.0.2 abi_x86_32")
    unmask(">=media-libs/gst-plugins-bad-1.14.5 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-gtk-1.14.5 abi_x86_32")
    unmask(">=dev-lang/orc-0.4.31 abi_x86_32")
    unmask(">=x11-libs/gtk+-3.24.13 abi_x86_32")
    unmask(">=media-libs/libepoxy-1.5.4 abi_x86_32")
    unmask(">=app-accessibility/at-spi2-atk-2.34.0 abi_x86_32")
    unmask(">=app-accessibility/at-spi2-core-2.34.0 abi_x86_32")
    unmask(">=media-libs/libdvdcss-1.4.2 abi_x86_32")
    unmask(">=media-libs/libmpeg2-0.5.1-r2 abi_x86_32")
    unmask(">=media-libs/libdca-0.0.5-r3 abi_x86_32")
    unmask(">=media-libs/faad2-2.9.0 abi_x86_32")
    unmask(">=media-libs/a52dec-0.7.4-r7 abi_x86_32")
    unmask(">=media-libs/libtheora-1.1.1-r2 abi_x86_32")
    unmask(">=x11-libs/libXv-1.0.11-r1 abi_x86_32")
    unmask(">=media-libs/graphene-1.8.6 abi_x86_32")
    unmask(">=media-plugins/gst-plugins-cdparanoia-1.14.5 abi_x86_32")
    unmask(">=media-sound/cdparanoia-3.10.2-r7 abi_x86_32")
    unmask(">=virtual/krb5-0-r1 abi_x86_32")
    unmask(">=app-crypt/mit-krb5-1.17.1 abi_x86_32")
    unmask(">=sys-libs/e2fsprogs-libs-1.45.5 abi_x86_32")
    unmask(">=sys-apps/keyutils-1.6.1 abi_x86_32")
    unmask(">=dev-libs/libverto-0.3.1 abi_x86_32")
    unmask(">=dev-libs/libev-4.31 abi_x86_32")

}
presetup(){
        print_enter
        printf "${Green}################ \n## Pre-Setup: ##\n################\n"
}
basicsetup(){
        print_enter
        printf "${Green}################ \n## Pre-Setup: ##\n################\n"
}
dewm(){
        print_enter
        printf "${Green}################ \n## Desktop Environments | Window Managers: ##\n################\n"
}
accs(){
        print_enter
        printf "${Green}################ \n## Accessories Apps: ##\n################\n"
}
dev(){
        print_enter
        printf "${Green}################ \n## Development Apps: ##\n################\n"
}
office(){
        print_enter
        printf "${Green}################ \n## Office Apps: ##\n################\n"
}
sys(){
  print_enter
  printf "${Green}################ \n# System Tools Apps: #\n################"
}

header(){
  clear
  printf "${Purple}$(print_line)"
  printf "${Purple}                  Gentoo Linux Ultimate Post Schwifter By Baraa Al-Masri\n"
  print_line
  printf "${BPurple}                              You gotta get schwifty in here\n"
  print_line
}
welcome(){
	clear
  printf "${Bold}${Cyan}$(print_line)"
	printf "${White}Welcome to the Gentoo Linux Schwifter(installer) script by Baraa Al-Masri${White}\n"
  printf "${Cyan}$(print_line)"
	printf "${Cyan}Requirements : \n -> Gentoo Linux Installation \n -> Root or normal user with sudo running the program \n -> Working Internet Connection\n -> A lot of time(approx. 12 hours) & patience \n -> A barrel of coffee\n"
  printf "${Cyan}$(print_line)"
	printf "Program can be canceled anytime with CTRL+C \n"
  printf "${Cyan}$(print_line)"
  printf "https://github.com/baraa-almasri/schwifter\n"
  printf "${Cyan}$(print_line)"
	printf "${Red}P.S. This is still a beta version ,\n it supports only english locale and x86_64 architecture \n"
	printf "${Purple}more locales and architectures will be supported in the future :) \n"
  printf "${Cyan}$(print_line)"
}
mainmenu() {
        printf "${White}\n################################ \n## Main Menu: ## \n################################\n\n"
        printf "1. Basic Setup \n"
        printf "2. Desktop Environments | Window Managers \n"
        printf "3. Accessories Apps \n"
        printf "4. Development Apps \n"
        printf "5. Office Apps \n"
        #printf "6. System Apps \n"
        # "7. Graphics Apps \n";
        # "8. Internet Apps \n";
        # "9. Audio Apps \n";
        # "10. Video Apps \n";
        # "11. Games \n";
        # "12. Web server \n";
        # "13. Fonts \n";
        # "14. Cleaning Up \n";*/
        #   echo "17) $(mainmenu_item "${checklist[17]}" "Reconfigure System")"
        #
}
desktops(){
        printf "${Red}Caution !!!! When Installing KDE make sure that you selected the plasma profile,\n also when installing Gnome make sure that you selected the gnome profile \n the rest can work with any profile . \n\n"
        printf "${White}1. KDE Plasma \t|\t7. i3wm\n"
        printf "2. Xfce \t|\t8. Openbox\n"
        printf "3. LXDE \n"
        printf "4. LXQt \n"
        printf "5. Mate \n"
        printf "6. GNOME \n\n"
        printf "d. Done(go back to main menu)\n"

}
accessories(){
        printf "${White}1. Albert\n"
        printf "2. Kitty \n"
        printf "3. Cheese \n"
        printf "4. Latte Dock \n"
        printf "5. Galculator \n"
        printf "6. Terminator \n\n"
        printf "d. Done(go back to main menu)\n"

}
development(){
        printf "${White}1. Atom\n"
        printf "2. Gvim \n"
        printf "3. Visual Studio Code ${Cyan}(flatpak)  \n"
        printf "${White}4. JRE \n"
        printf "5. JDK  \n"
        printf "6. Clang \n"
        printf "7. Codeblocks \n"
        printf "8.  Arduino IDE ${Cyan}(flatpak)  \n"
        printf "${White}9. Android Studio ${Cyan}(flatpak)  \n"
        printf "${White}10. GitKraken ${Cyan}(flatpak)  \n"
        printf "${White}11. NetBeans ${Cyan}(flatpak)  \n\n"
        printf "${White}d. Done(go back to main menu)\n"

}
officemenu(){
        printf "${White}1. Libreoffice\n"
        printf "2. Libreffice (bin) ${BRed} \"RECOMMENDED\" \n"
        printf "${White}3. Evince   \n"
        printf "4. Ghostwriter \n"
        printf "5. Openoffice  \n"
        printf "\n PLEASE RECOMMEND ME SOME OFFICE APPS TO PUT IN HERE  \n\n"
        printf "d. Done(go back to main menu)\n"
}
systemtoolsmenu(){
          printf "${White}1. Firewalld \n"
          printf "${White}2. Gparted\n"
          printf "${White}3. Gnome Disks \n"
          printf "${White}4. Htop \n"
          printf "${White}5. Wine \n"
          printf "${White}6. Wine Staging ${BRed} \"Recommended\" \n"
          printf "${White}7. VMware Workstation 12 ${BPurple}(overlays) \n\n"
          printf "${White}d. Done(go back to main menu)\n"
}

timezones(){
  printf "${BWhite}Choose your region:\n"
  printf "${White} 1.Africa\t2.America\t3.Antarctica\t4.Asia\n5.Atlantic\t6.Australia\t7.Europe\t8.Indian\t9.Pacific\n"
  read region
  case "$region" in
    1) printf "${White}1.Africa/Abidjan\t2.Africa/Accra\t3.Africa/Algiers4.Africa/Bissau\t5.Africa/Cairo\t6.Africa/Casablanca\t7.Africa/Ceuta\t8.Africa/El_Aaiun\t9.Africa/Johannesburg\t10.Africa/Juba\n11.Africa/Khartoum\t12.Africa/Lagos\t13.Africa/Maputo\t14.Africa/Monrovia\t15.Africa/Nairobi\t16.Africa/Ndjamena\t17.Africa/Sao_Tome\t18.Africa/Tripoli\t19.Africa/Tunis\t20.Africa/Windhoek\n"
        read city
        echo $(cat ./configuration_files/timezones/africa | head -n $city | tail -n 1) > /etc/localtime
    ;;
    2) printf "${White}1 America/Adak\t2 America/Anchorage\t3 America/Araguaina\t4 America/Argentina/Buenos_Aires\t5 America/Argentina/Catamarca\t6 America/Argentina/Cordoba\t7 America/Argentina/Jujuy\t8 America/Argentina/La_Rioja\t9 America/Argentina/Mendoza\t10 America/Argentina/Rio_Gallegos\n11 America/Argentina/Salta\t12 America/Argentina/San_Juan\t13 America/Argentina/San_Luis\t14 America/Argentina/Tucuman\t15 America/Argentina/Ushuaia\t16 America/Asuncion\t17 America/Atikokan\t18 America/Bahia\t19 America/Bahia_Banderas\t20 America/Barbados\n21 America/Belem\t22 America/Belize\t23 America/Blanc-Sablon\t24 America/Boa_Vista\t25 America/Bogota\t26 America/Boise\t27 America/Cambridge_Bay\t28 America/Campo_Grande\t29 America/Cancun\t30 America/Caracas\n31 America/Cayenne\t32 America/Chicago\t33 America/Chihuahua\t34 America/Costa_Rica\t35 America/Creston\t36 America/Cuiaba\t37 America/Curacao\t38 America/Danmarkshavn\t39 America/Dawson\t40 America/Dawson_Creek\n41 America/Denver\t42 America/Detroit\t43 America/Edmonton\t44 America/Eirunepe\t45 America/El_Salvador\t46 America/Fort_Nelson\t47 America/Fortaleza\t48 America/Glace_Bay\t49 America/Godthab\t50 America/Goose_Bay\n51 America/Grand_Turk\t52 America/Guatemala\t53 America/Guayaquil\t54 America/Guyana\t55 America/Halifax\t56 America/Havana\t57 America/Hermosillo\t58 America/Indiana/Indianapolis\t59 America/Indiana/Knox\t60 America/Indiana/Marengo\n 61 America/Indiana/Petersburg\t62 America/Indiana/Tell_City\t63 America/Indiana/Vevay\t64 America/Indiana/Vincennes\t65 America/Indiana/Winamac\t66 America/Inuvik\t67 America/Iqaluit\t68 America/Jamaica\t69 America/Juneau\t70 America/Kentucky/Louisville\n71 America/Kentucky/Monticello\t72 America/La_Paz\t73 America/Lima\t74 America/Los_Angeles\t75 America/Maceio\t76 America/Managua\t77 America/Manaus\t78 America/Martinique\t79 America/Matamoros\t80 America/Mazatlan\n81 America/Menominee\t82 America/Merida\t83 America/Metlakatla\t84 America/Mexico_City\t85 America/Miquelon\t86 America/Moncton\t87 America/Monterrey\t88 America/Montevideo\t89 America/Nassau\t90 America/New_York\n91 America/Nipigon\t92 America/Nome\t93 America/Noronha\t94 America/North_Dakota/Beulah\t95 America/North_Dakota/Center\t96 America/North_Dakota/New_Salem\t97 America/Ojinaga\t98 America/Panama\t99 America/Pangnirtung\t100 America/Paramaribo\n101 America/Phoenix\t102 America/Port-au-Prince\t103 America/Port_of_Spain\t104 America/Porto_Velho\t105 America/Puerto_Rico\t106 America/Punta_Arenas\t107 America/Rainy_River\t108 America/Rankin_Inlet\t109 America/Recife\t110 America/Regina\n111 America/Resolute\t112 America/Rio_Branco\t113 America/Santarem\t114 America/Santiago\t115 America/Santo_Domingo\t116 America/Sao_Paulo\t117 America/Scoresbysund\t118 America/Sitka\t119 America/St_Johns\t120 America/Swift_Current\n121 America/Tegucigalpa\t122 America/Thule\t123 America/Thunder_Bay\t124 America/Tijuana\t125 America/Toronto\t126 America/Vancouver\t127 America/Whitehorse\t128 America/Winnipeg\t129 America/Yakutat\t130 America/Yellowknife\n"
    read city
    echo $(cat ./configuration_files/timezones/america | head -n $city | tail -n 1) > /etc/localtime
    ;;
    3) printf "${White}1 Antarctica/Casey\t2 Antarctica/Davis\t3 Antarctica/DumontDUrville\t4 Antarctica/Macquarie\t5 Antarctica/Mawson\t6 Antarctica/Palmer\t7 Antarctica/Rothera\t8 Antarctica/Syowa\t9 Antarctica/Troll\t10 Antarctica/Vostok\n"
    read city
    echo $(cat ./configuration_files/timezones/antarctica | head -n $city | tail -n 1) > /etc/localtime
    ;;
    4) printf "${White}1 Asia/Almaty\t2 Asia/Amman\t3 Asia/Anadyr\t4 Asia/Aqtau\t5 Asia/Aqtobe\t6 Asia/Ashgabat\t7 Asia/Atyrau\t8 Asia/Baghdad\t9 Asia/Baku\t10 Asia/Bangkok\n11 Asia/Barnaul\t12 Asia/Beirut\t13 Asia/Bishkek\t14 Asia/Brunei\t15 Asia/Chita\t16 Asia/Choibalsan\t17 Asia/Colombo\t18 Asia/Damascus\t19 Asia/Dhaka\t20 Asia/Dili\n21 Asia/Dubai\t22 Asia/Dushanbe\t23 Asia/Famagusta\t24 Asia/Gaza\t25 Asia/Hebron\t26 Asia/Ho_Chi_Minh\t27 Asia/Hong_Kong\t28 Asia/Hovd\t29 Asia/Irkutsk\t30 Asia/Jakarta\n31 Asia/Jayapura\t32 Asia/Jerusalem\t33 Asia/Kabul\t34 Asia/Kamchatka\t35 Asia/Karachi\t36 Asia/Kathmandu\t37 Asia/Khandyga\t38 Asia/Kolkata\t39 Asia/Krasnoyarsk\t40 Asia/Kuala_Lumpur\n40 Asia/Kuala_Lumpur\t41 Asia/Kuching\t42 Asia/Macau\t43 Asia/Magadan\t44 Asia/Makassar\t45 Asia/Manila\t46 Asia/Nicosia\t47 Asia/Novokuznetsk\t48 Asia/Novosibirsk\t49 Asia/Omsk\t50 Asia/Oral\t51 Asia/Pontianak\t52 Asia/Pyongyang\t53 Asia/Qatar\t54 Asia/Qostanay\t55 Asia/Qyzylorda\t56 Asia/Riyadh\t57Asia/Sakhalin\t58 Asia/Samarkand\t59 Asia/Seoul\t60 Asia/Shanghai\n61 Asia/Singapore\t62 Asia/Srednekolymsk\t63 Asia/Taipei\t64 Asia/Tashkent\t65 Asia/Tbilisi\t66 Asia/Tehran\t67 Asia/Thimphu\t68 Asia/Tokyo\t69 Asia/Tomsk\t70 Asia/Ulaanbaatar\n71 Asia/Urumqi\t72 Asia/Ust-Nera\t73 Asia/Vladivostok\t74 Asia/Yakutsk\t75 Asia/Yangon\t76 Asia/Yekaterinburg\t77 Asia/Yerevan\n"
    read city
    echo $(cat ./configuration_files/timezones/asia | head -n $city | tail -n 1) > /etc/localtime
    ;;
    5) printf "${White}1 Atlantic/Azores\t2 Atlantic/Bermuda\t3 Atlantic/Canary\t4 Atlantic/Cape_Verde\t5 Atlantic/Faroe\t6 Atlantic/Madeira\t7 Atlantic/Reykjavik\t8 Atlantic/South_Georgia\t9 Atlantic/Stanley\n"
    read city
    echo $(cat ./configuration_files/timezones/atlantic | head -n $city | tail -n 1) > /etc/localtime
    ;;
    6) printf "${White}1 Australia/Adelaide\t2 Australia/Brisbane\t3 Australia/Broken_Hill\t4 Australia/Currie\t5 Australia/Darwin\t6 Australia/Eucla\t7 Australia/Hobart\t8 Australia/Lindeman\t9 Australia/Lord_Howe\t10 Australia/Melbourne\n11 Australia/Perth\t12 Australia/Sydney\n"
    read city
    echo $(cat ./configuration_files/timezones/australia | head -n $city | tail -n 1) > /etc/localtime
    ;;
    7) printf "${White}1 Europe/Amsterdam\t2 Europe/Andorra\t3 Europe/Astrakhan\t4 Europe/Athens\t5 Europe/Belgrade\t6 Europe/Berlin\t7 Europe/Brussels\t8 Europe/Bucharest\t9 Europe/Budapest\t10 Europe/Chisinau\n11 Europe/Copenhagen\t12 Europe/Dublin\t13 Europe/Gibraltar\t14 Europe/Helsinki\t15 Europe/Istanbul\t16 Europe/Kaliningrad\t17 Europe/Kiev\t18 Europe/Kirov\t19 Europe/Lisbon\t20 Europe/London\n21 Europe/Luxembourg\t22 Europe/Madrid\t23 Europe/Malta\t24 Europe/Minsk\t25 Europe/Monaco\t26 Europe/Moscow\t27 Europe/Oslo\t28 Europe/Paris\t29 Europe/Prague\t30 Europe/Riga\n31 Europe/Rome\t32 Europe/Samara\t33 Europe/Saratov\t34 Europe/Simferopol\t35 Europe/Sofia\t36 Europe/Stockholm\t37 Europe/Tallinn\t38 Europe/Tirane\t39 Europe/Ulyanovsk\t40 Europe/Uzhgorod\n41 Europe/Vienna\t42 Europe/Vilnius\t43 Europe/Volgograd\t44 Europe/Warsaw\t45 Europe/Zaporozhye\t46 Europe/Zurich\n"
    read city
    echo $(cat ./configuration_files/timezones/europe | head -n $city | tail -n 1) > /etc/localtime
    ;;
    8) printf "${White}1 Indian/Chagos\t2 Indian/Christmas\t3 Indian/Cocos\t4 Indian/Kerguelen\t5 Indian/Mahe\t6 Indian/Maldives\t7 Indian/Mauritius\t8 Indian/Reunion\n"
    read city
    echo $(cat ./configuration_files/timezones/indian | head -n $city | tail -n 1) > /etc/localtime
    ;;
    9) printf "${White}1 Pacific/Apia\t2 Pacific/Auckland\t3 Pacific/Bougainville\t4 Pacific/Chatham\t5 Pacific/Chuuk\t6 Pacific/Easter\t7 Pacific/Efate\t8 Pacific/Enderbury\t9 Pacific/Fakaofo\t10 Pacific/Fiji\n11 Pacific/Funafuti\t12 Pacific/Galapagos\t13 Pacific/Gambier\t14 Pacific/Guadalcanal\t15 Pacific/Guam\t16 Pacific/Honolulu\t17 Pacific/Kiritimati\t18 Pacific/Kosrae\t19 Pacific/Kwajalein\t20 Pacific/Majuro\n21 Pacific/Marquesas\t22 Pacific/Nauru\t23 Pacific/Niue\t24 Pacific/Norfolk\t25\tPacific/Noumea\t26 Pacific/Pago_Pago\t27 Pacific/Palau\t28 Pacific/Pitcairn\t29 Pacific/Pohnpei\t30 Pacific/Port_Moresby\n31 Pacific/Rarotonga\t32 Pacific/Tahiti\t33 Pacific/Tarawa\t34 Pacific/Tongatapu\t35 Pacific/Wake\t36 Pacific/Wallis\n"
    read city
    echo $(cat ./configuration_files/timezones/pacific | head -n $city | tail -n 1) > /etc/localtime
    ;;
  esac

}

vga(){
  lspci  -v -s  $(lspci | grep ' VGA ' | cut -d" " -f 1) | grep 'Kernel modules: ' > vga.txt
  lspci | grep VGA > vga2.txt
  kk="vga.txt"
  lol="vga2.txt"
  #vga_card="none"
  #AMDGPU
  cat $kk | grep amdgpu || echo "Not amdgpu!"
  cat $kk | grep amdgpu && vga_card="amdgpu"
  #$kk | grep amdgpu && emerge -qv xf86-video-amdgpu
  #RADEON
  cat $kk | grep radeon || echo "Not radeon!"
  cat $kk | grep radeon && vga_card="ati"
  #$kk | grep radeon && emerge -qv xf86-video-ati
  #INTEL
  cat $lol | grep Intel  || echo "Not intel!"
  cat $lol | grep Intel && vga_card="intel"
  #VM WARE
  cat $kk | grep vmwgfx || echo "Not vmware!"
  cat $kk | grep vmwgfx && vga_card="vmware"
  #VirtualBox
  cat $kk | grep vboxvideo || echo "Not vboxvideo!"
  cat $kk | grep vboxvideo && vga_card="vboxvideo"
  #NVIDIA
  cat $kk | grep nvidia || echo "Not nvidia!"
  cat $kk | grep nvidia && vga_card="nouveau"
  #Nouveau [NVIDIA]
  cat $kk | grep nouveau || echo "Not nouveau!"
  cat $kk | grep nouveau && vga_card="nouveau"
  #Vesa
  cat $kk | grep vesa || echo "Not vesa!"
  cat $kk | grep vesa && vga_card="vesa"
  #Dummy
  cat $kk | grep dummy || echo "Not dummy!"
  cat $kk | grep dummy && vga_card="dummy"

  printf "Detected $vga_card chip ....\n"

  #Installing the package
  emerge -qv xf86-video-$vga_card
  rm vga{,2}.txt

}
