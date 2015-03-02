import scala.util.continuations.{reset, shift}


object Main {

  def main(args: Array[String]) {

    // ここから継続の範囲
    val result = reset {

      // call/cc
      // ctx は継続オブジェクト
      val r = shift {ctx: (Int => Int) => {
        println("hoge")
        val x = ctx(10) // shift の直後に移行
        println(x)
        println("piyo")
        20 // reset の値になる
      }}

      println(r)
      println("fuga")
      100 // ctx を呼んだ時の返り値
    }

    println(result)
  }
}
