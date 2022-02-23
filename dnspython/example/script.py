import dns.resolver

answer = dns.resolver.resolve('github.com')
print(answer.rrset.to_text())
