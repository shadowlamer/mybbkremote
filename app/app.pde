import android.hardware.ConsumerIrManager;
import android.content.Context;
import android.os.Bundle;
import android.view.WindowManager;
import android.app.Activity;



Context context;
private static final int frequency=33000;
private UI ui;

int[] patVolumeUp =    {8700, 4200, 600, 1500, 700, 1500, 600, 1500, 600, 500, 600, 500, 600, 400, 600, 500, 600, 500, 600, 400, 700, 400, 600, 500, 600, 1500, 600, 1500, 700, 1500, 600, 1500, 600, 1600, 600, 1500, 600, 1600, 500, 500, 600, 500, 600, 500, 600, 400, 600, 500, 600, 500, 600, 400, 700, 400, 600, 1500, 700, 1500, 600, 1500, 600, 1600, 600, 1500, 600, 1500, 700};
int[] patVolumeDown =  {8600, 4300, 600, 1500, 600, 1600, 600, 1500, 600, 500, 600, 400, 700, 400, 600, 500, 600, 500, 600, 400, 600, 500, 600, 500, 600, 1500, 600, 1500, 700, 1500, 600, 1500, 600, 1600, 600, 1500, 600, 1600, 600, 400, 600, 1600, 500, 500, 600, 500, 600, 1500, 600, 500, 600, 500, 600, 400, 700, 1500, 600, 400, 700, 1500, 600, 1500, 600, 500, 600, 1500, 600};
int[] patAudioSelect = {8700, 4300, 600, 1500, 600, 1600, 500, 1600, 600, 500, 500, 500, 600, 500, 600, 500, 500, 500, 600, 500, 600, 500, 500, 500, 600, 1600, 600, 1500, 600, 1600, 600, 1500, 600, 1600, 600, 400, 600, 1600, 600, 1500, 600, 500, 600, 1500, 600, 500, 600, 1500, 600, 500, 600, 1500, 700, 400, 600, 500, 600, 1500, 700, 400, 600, 1500, 600, 500, 600, 1500, 600};
int[] patOnOff =       {8600, 4300, 600, 1600, 500, 1600, 600, 1500, 600, 500, 600, 500, 600, 400, 600, 500, 600, 500, 600, 400, 600, 500, 600, 500, 600, 1500, 600, 1600, 500, 1600, 600, 1500, 600, 1600, 600, 500, 500, 500, 600, 500, 500, 500, 600, 500, 600, 500, 600, 1500, 600, 500, 600, 1500, 600, 1600, 500, 1600, 600, 1600, 600, 1500, 600, 1500, 600, 500, 600, 1500, 600};

void setup() {
  fullScreen(P2D);
  ui = new UI();
}

void draw() {
}

void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  getActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}

void onStop() {
  super.onStop();
  getActivity().finish();
  System.exit(0);
}

void touchStarted() {
  context = getActivity();
  ConsumerIrManager consumerIrManager = (ConsumerIrManager) context.getSystemService(Context.CONSUMER_IR_SERVICE);
  String key = ui.getKey();
//  println(key);
  if ("volUp".equals(key)) {
    consumerIrManager.transmit(frequency, patVolumeUp);
  }
  if ("volDown".equals(key)) {
    consumerIrManager.transmit(frequency, patVolumeDown);
  }
  if ("onOff".equals(key)) {
    consumerIrManager.transmit(frequency, patOnOff);
  }
  if ("audio".equals(key)) {
    consumerIrManager.transmit(frequency, patAudioSelect);
  }
}
