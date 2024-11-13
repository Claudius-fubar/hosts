cat /etc/hosts | tail -n +8 | while read  line; do
    ipAddress=$(echo "$line" | awk '{print $1}')
    domain=$(echo "$line" | awk '{print $2}')
    officialDomainIP=$(nslookup $domain 8.8.8.8 | grep Address | awk 'NR==2 {print $2}')
    if [ "$ipAddress" != "$officialDomainIP" ]; then 
        echo "Bogus IP for $domain in /etc/hosts !"
    fi
done