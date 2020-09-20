function divisible_by(n, divider)
{
    return n % divider === 0;
}

function is_prime(n)
{
    for ( let k = 2; k < n; ++k )
    {
        if ( divisible_by(n, k) )
        {
            return false;
        }
    }

    return true;
}

function* primes()
{
    let n = 2;

    while ( true )
    {
        if ( is_prime(n) )
        {
            yield n;
        }

        n++;
    }
}
