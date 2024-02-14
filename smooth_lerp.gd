# Based on this delta-time smooth lerp:
# https://twitter.com/freyaholmer/status/1757836988495847568

# lerp between from/to, with a desired time (in seconds) until it reaches the halfway point
func lerp_smooth(from: float, to: float, delta: float, halflife: float) -> float:
	return to + (from - to) * pow(2, -delta / halflife)

# for easier migration from lerp()
func lerp_smooth_migrate(from: float, to: float, weight: float, delta: float, fps: int = 60) -> float:
	var halflife = (-(1/fps)) / (log(1 - weight) / log(2))
	return lerp_smooth(from, to, delta, halflife)
  
