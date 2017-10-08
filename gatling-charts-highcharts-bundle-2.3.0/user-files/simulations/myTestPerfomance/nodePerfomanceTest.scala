package makingthehand

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class PerfomanceApp extends Simulation {
     val httpConf = http
	.baseURL("http://ubuntu_lab.com")
	.userAgentHeader("Mozilla/5.0 (ubuntu; Linux x86_64) Firefox/54.0")
    
     val scn = scenario("Node Application")
	.repeat(15) {
		      exec(
			   http("PerfomanceApp").get("/")
			  )
	}
	setUp(
              scn.inject(rampUsers(1000) over (10 seconds))).protocols(httpConf)
}



