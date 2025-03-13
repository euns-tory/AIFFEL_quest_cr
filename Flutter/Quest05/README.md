# 결과
![jellyfish-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/44c78dc5-6be1-481e-9c18-cf04c678ee26)

# 문제 해결
- ValueError: Input 0 is incompatible with layer vgg16: expected shape=(None, 224, 224, 3), found shape=(None, 224, 224, 4)
- VGG16 모델에 입력된 데이터의 차원이 예상과 맞지 않아서 발생한 오류
- VGG16 모델은 RGB 이미지 (채널 수 3개)를 입력으로 기대하지만, 현재 입력된 이미지에는 알파 채널이 포함되어 있어서 채널 수가 4개!!
- 해결 방법: vgg16_prediction_model.py에서 채널 수를 RGB로 변경하였다.
![스크린샷 2025-03-13 오후 4 12 48](https://github.com/user-attachments/assets/5008e842-e75c-4651-a8e4-caf603d772de)

# 회고
고은: 모델을 서버에 통합하고, Flutter와 연결하는 데 있어 실수 포인트가 많아 디버깅에 시간이 많이 소요되었습니다. 앞으로는 API와 앱 연결을 더 연습하고 전체 흐름에 익숙해져서 오류를 효율적으로 처리할 수 있도록 개선해야겠다고 느꼈습니다.

홍지수: 문제를 푸는 것보다 환경 설정이 더 까다로웠던 퀘스트였다. 서버가 5번 넘게 튕겼고, 로컬에서는 계속 패키지가 없다고 떴다.. 이를 해결하기보다는 서버가 다시 튕기기 전에 빨리 완성하자는 생각이 더 컸다. 결국 겨우겨우 마무리했고, 결과물이 잘 나와서 만족스럽다.

# 주석
main.dart 참고
