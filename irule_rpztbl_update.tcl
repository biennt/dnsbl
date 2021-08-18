when HTTP_REQUEST {
set content "unknown request\n"
    switch -glob [string tolower [HTTP::path]] {
       "/insert*" {
            set fqdn [URI::query [HTTP::uri] fqdn]
            set cname [URI::query [HTTP::uri] cname]
            table set -subtable rpztbl $fqdn $cname indef indef
            set content "($fqdn --> $cname) has been inserted\n"
        }
       "/count" {
            set total [table keys -subtable rpztbl -count]
            set content "Total records: $total\n"
        }
       "/delete" {
            table delete -subtable rpztbl -all
            set content "table rpztbl has been deleted\n"
        }
        default {
        }
    }
    HTTP::respond 200 content $content
}
