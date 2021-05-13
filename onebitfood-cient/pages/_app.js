import Head from 'next/head'
import '../styles/globals.scss'

function MyApp({ Component, pageProps }) {
  return (
    <>
      <Head>
          <title>Onebitfood</title>
          <link ref="icon" href="/favicon.icon" />
      </Head>

      <main>
        <Component {...pageProps} />
      </main>
    </>
  )
}

export default MyApp
