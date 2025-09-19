UCLASS(Blueprintable, meta=(DisplayName="My Cool Character"))
// ^ @attribute
//        ^ @property
//                      ^ @property
//                               ^ @property
//                                           ^ @string
class AMyCharacter : public ACharacter
{
	GENERATED_BODY()
    //  ^ @function.macro

public:
	UPROPERTY(EditAnywhere, Category = "Config")
 // ^ @attribute
 //                         ^ @property
 //                                   ^ @string
	int32 Health;
protected:
	UFUNCTION(BlueprintCallable, Category = "Combat")
 // ^ @attribute
 //                              ^ @property
 //                                        ^ @string
	void Attack();
};
